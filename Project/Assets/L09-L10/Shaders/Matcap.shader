Shader "VS/Matcap" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _FresnelPow ("FresnelPow", Range(0, 5)) = 1
        _Matcap ("Matcap", 2D) = "gray" {}
        _EnvSpecInt ("EnvSpecInt", Range(0, 5)) = 2
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
            uniform sampler2D _NormalMap;
            uniform sampler2D _Matcap;
            uniform float _FresnelPow;
            uniform float _EnvSpecInt;

            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 将模型的顶点信息输入进来
                float3 normal : NORMAL;
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
                VertexOutput o = (VertexOutput)0;               // 新建一个输出结构
                o.uv0 = v.uv0;
                o.pos = UnityObjectToClipPos( v.vertex );       // 变换顶点信息 并将其塞给输出结构
                o.posWS = mul(unity_ObjectToWorld, v.vertex);   // 顶点位置 OS>WS
                o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 法线方向 OS>WS
                o.tDirWS = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                return o;                                       // 将输出结构 输出
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                //准备向量
                float3 nDirTS = UnpackNormal(tex2D(_NormalMap, i.uv0)),rgb;
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS, TBN));                            // 用于计算 Fresnel 的 nDirWS
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);      // 用于计算 Fresnel 的 vDirWS
                float3 nDirVS = mul(UNITY_MATRIX_V, nDirWS);                            // 用于计算 Matcap

                //准备中间变量
                float3 vdotn = dot(nDirWS, vDirWS);
                float2 MatcapUV = nDirVS.rg * 0.5 + 0.5;

                //Fresnel
                float Fresnel = pow((1 - vdotn), _FresnelPow);
                //Matcap
                float3 Matcap = tex2D(_Matcap, MatcapUV);

                //envSpecLighiting
                float3 envSpecLighiting = Matcap * Fresnel * _EnvSpecInt;

                return float4(envSpecLighiting, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}