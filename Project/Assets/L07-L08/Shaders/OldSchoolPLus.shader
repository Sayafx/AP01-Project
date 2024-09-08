﻿Shader "VS/OldSchoolPLus" 
{
    Properties {
        _UpColor ("UpColor", Color) = (0.369571,0.4787563,0.5188679,1)
        _BottomColor ("BottomColor", Color) = (0.4433962,0.4050511,0.361828,1)
        _SideColor ("SideColor", Color) = (0.7830189,0.7830189,0.7830189,1)
        _Occlusion ("Occlusion", 2D) = "white" {}
        _SpecularPow ("高光次幂", Range(10, 30)) = 10
        _LightColor ("LightColor", Color) = (0.8584906,0.6681648,0.7958517,1)
        _BaseColor ("BaseColor", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }


            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"      // 使用Unity投影必须包含这两个库文件
            #include "Lighting.cginc"       // 同上
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0

            //输入参数
            uniform float3 _UpColor;
            uniform float3 _BottomColor;
            uniform float3 _SideColor;
            uniform sampler2D _Occlusion;
            uniform float _SpecularPow;
            uniform float3 _LightColor;
            uniform float3 _BaseColor;

            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 将模型的顶点信息输入进来
                float3 normal : NORMAL;
                float2 uv0 : TEXCOORD0;     // uv0 用来采样贴图
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 由模型顶点信息换算而来的顶点屏幕位置
                float3 posWS : TEXCOORD0;       // 世界空间顶点位置
                float2 uv0 : TEXCOORD1;         // uv
                float3 nDirWS : TEXCOORD2;      // 世界空间下的法线信息
                LIGHTING_COORDS(3,4)            // 投影用坐标信息， Unity 已封装，不用管细节
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                   // 新建一个输出结构
                o.uv0 = v.uv0;                                      // uv
                o.pos = UnityObjectToClipPos( v.vertex );           // 变换顶点位置 OS>CS
                o.nDirWS = UnityObjectToWorldNormal( v.normal );    // 变换法线方向 OS>WS
                o.posWS = mul(unity_ObjectToWorld, v.vertex);       // 变换顶点位置 OS>WS
                TRANSFER_VERTEX_TO_FRAGMENT(o);                     // 阴影需要
                return o;                                           // 将输出结构 输出
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                //准备向量
                float3 nDir = i.nDirWS;
                float3 lDir = _WorldSpaceLightPos0.xyz;
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float3 rDir = reflect(lDir*(-1.0), nDir);

                //准备点积
                float3 nDotl = dot(nDir, lDir);
                float3 rDotv = dot(rDir, vDir);

                //光照模型
                //输出Lambert
                float3 Lambert = max(0.0, nDotl);
                //输出Phong
                float3 Phong = pow(max(0.0, rDotv), _SpecularPow);
                //输出Shadow
                float shadow = LIGHT_ATTENUATION(i);       // Unity 封装好的函数，可取出投影

               


                //准备 3ColorAmbient
                //准备遮罩
                float UpMask = max(0.0, nDir.g);                //向上部分的遮罩
                float BottomMask = max(0.0, -nDir.g);           //向下部分的遮罩
                float SideMask = 1.0 - UpMask - BottomMask;     //侧面部分的遮罩
                //混合环境色
                float3 EnvColor = UpMask * _UpColor + BottomMask * _BottomColor + SideMask * _SideColor;
                //采样 Occlusion 贴图
                float Occlusion = tex2D(_Occlusion, i.uv0);
                //输出 3ColorAmbient 即环境光影响的结果
                float3 ThreeColorAmbient = EnvColor * _BaseColor * Occlusion;

                //光源影响的结果
                float3 LightEnd = ((Phong + Lambert * _BaseColor) * _LightColor) * shadow;

                //最终颜色

                float3 FinalColor = LightEnd + ThreeColorAmbient;

                //返回最终颜色
                return float4(FinalColor, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}