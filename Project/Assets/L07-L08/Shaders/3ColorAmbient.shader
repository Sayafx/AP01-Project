Shader "VS/3ColAmbient" 
{
    Properties {
        _UpColor ("UpColor", Color) = (0.4,0.5,0.5,1.0)
        _BottomColor ("BottomColor", Color) = (0.4,0.4,0.4,1.0)
        _SideColor ("SideColor", Color) = (0.8,0.8,0.8,1.0)
        _Occlusion ("Occlusion", 2D) = "white" {}
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0

            //输入参数
            uniform float3 _UpColor;
            uniform float3 _BottomColor;
            uniform float3 _SideColor;
            uniform sampler2D _Occlusion;

            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 将模型的顶点信息输入进来
                float3 normal : NORMAL;
                float2 uv0 : TEXCOORD0;     // uv0 用来采样贴图
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 由模型顶点信息换算而来的顶点屏幕位置
                float2 uv0 : TEXCOORD0;         // uv
                float3 nDirWS : TEXCOORD1;   // 世界空间下的法线信息
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;           // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );   // 变换顶点信息 并将其塞给输出结构
                o.uv0 = v.uv0;
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                return o;                                   // 将输出结构 输出
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                //准备向量
                float3 nDir = i.nDirWS;
                //准备遮罩
                float UpMask = max(0.0, nDir.g);                //向上部分的遮罩
                float BottomMask = max(0.0, -nDir.g);           //向下部分的遮罩
                float SideMask = 1.0 - UpMask - BottomMask;     //侧面部分的遮罩
                //混合环境色
                float3 EnvColor = UpMask * _UpColor + BottomMask * _BottomColor + SideMask * _SideColor;
                //采样 Occlusion 贴图
                float Occlusion = tex2D(_Occlusion, i.uv0);
                //最终环境光照
                float3 EnvLighting = EnvColor * Occlusion;

                //返回最终颜色
                return float4(EnvLighting, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}