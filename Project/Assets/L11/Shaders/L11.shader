Shader "VS/L11"
{
    Properties {
        [Header(Texture)]
            [Space(10)]
                [NoScaleOffset] _MainTex    ("RGB:基础颜色 A:自发光遮罩" , 2D)                      = "white" {}
                [NoScaleOffset] _NormTex    ("RGB:法线贴图" , 2D)                                  = "bump"  {}
                [NoScaleOffset] _SpecTex    ("R:高光遮罩 G:高光次幂 B:金属度贴图 A:基础色遮罩" , 2D)  = "gray" {}
                [NoScaleOffset] _RimMask    ("RGB:边缘光遮罩" , 2D)                                =  "gray" {}
                [NoScaleOffset] _TransMask  ("RGB:透明遮罩" , 2D)                                 = "white" {}
        [Header(Diffuse)]
            [Space(10)]
                _MainCol        ("基本色" , Color)           = (1.0 , 1.0 , 1.0 , 1.0)
                _DiffuseInt     ("漫反射强度" , Range(1,3))  = 1.3
        [Header(Specular)]
            [Space(10)]
                _SpecPow        ("高光次幂" , Range(1,90))  = 30
                _SpecInt        ("高光强度" , Range(1,10))  = 1.0
                _FrensnelPow    ("菲尼尔次幂" , Range(0,7)) = 3
        [Header(Emission)]
            [Space(10)]
                _EmitInt        ("自发光强度" , Range(0.7,1.0)) = 0.7
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
            //Texture
            uniform sampler2D _MainTex;
            uniform sampler2D _NormTex;
            uniform sampler2D _SpecTex;
            uniform sampler2D _RimMask;
            uniform sampler2D _TransMask;
            //Diffuse
            uniform float3 _MainCol;
            uniform float _DiffuseInt;
            //Specular
            uniform float _SpecPow;
            uniform float _SpecInt;
            uniform float _FrensnelPow;
            //Emission
            uniform float _EmitInt;

            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 将模型的顶点信息输入进来
                float4 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 uv0 : TEXCOORD0;
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;   // 由模型顶点信息换算而来的顶点屏幕位置
                float2 uv0 : TEXCOORD0;
                float4 posWS : TEXCOORD1;
                float3 nDirWS : TEXCOORD2;
                float3 tDirWS : TEXCOORD3;
                float3 bDirWS : TEXCOORD4;
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;           // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );   // 变换顶点信息 并将其塞给输出结构
                o.uv0 = v.uv0;
                o.posWS = mul(unity_ObjectToWorld, v.vertex);   // 顶点位置 OS>WS
                o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 法线方向 OS>WS
                o.tDirWS = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w); 
                return o;                                   // 将输出结构 输出
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                //准备向量
                float3 nDirTS = UnpackNormal(tex2D(_NormTex, i.uv0)).rgb;
                float3x3 TBN = float3x3(i.tDirWS , i.bDirWS , i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS , TBN));

                float3 lDir = _WorldSpaceLightPos0.xyz;
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float3 rDirWS = reflect(-lDir , nDirWS);

                //准备点积
                float3 ndotl = dot(nDirWS , lDir);
                float3 rdotv = dot(rDirWS , vDirWS);
                float3 vdotn = dot(vDirWS , nDirWS);

                //采样纹理
                float4 var_MainTex = tex2D(_MainTex , i.uv0);
                float3 var_NormTex = tex2D(_NormTex , i.uv0);
                float4 var_SpecTex = tex2D(_SpecTex , i.uv0);
                float3 var_RimMask = tex2D(_RimMask , i.uv0);
                float3 var_TransMask = tex2D(_TransMask , i.uv0);

                //光照模型
                //直射光部分
                float3 BaseCol = _MainCol * var_MainTex;
                float3 Lambert = max(0.0 , ndotl);

                float3 SpecPow = lerp(1, _SpecPow , var_SpecTex.g);
                float3 Phong = pow(max(0.0 , rdotv) , SpecPow) * var_SpecTex.r;
                float3 FinalPhong = (Phong * var_SpecTex.b + Phong * var_SpecTex.a * BaseCol) * _SpecInt;

                float3 DirLighting = Lambert * BaseCol * _DiffuseInt + FinalPhong;
                //环境光部分
                float3 Fresnel = pow(1.0 - max(0.0 , vdotn) , _FrensnelPow) * var_RimMask;
                //自发光部分
                float3 Emission = BaseCol * var_MainTex.a * _EmitInt;

                //返回结果
                float3 finalRGB = DirLighting + Fresnel + Emission;
                //透明剔除片元，透明遮罩上小于 0.5 的部分，由于这次的透明遮罩非黑即白，这个数字只要大于0小于1即可。
                clip(var_TransMask - 0.5);
                

                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}