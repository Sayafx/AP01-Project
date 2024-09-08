Shader "VS/OldSchoolKai"
{
    Properties {
        _SpecularPow ("高光次幂", Range(10, 90)) = 10
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

            // 输入参数
            uniform float _SpecularPow;

            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 输入模型的顶点信息
                float3 normal : NORMAL;     // 输入模型的法线信息
            };

            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 由模型顶点信息换算而来的顶点屏幕位置
                float4 posWS : TEXCOORD0;       // 世界科技顶点位置
                float3 nDirWS : TEXCOORD1;      // 世界空间法线方向
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                   //新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );           //变换顶点位置 OS>CS
                o.posWS = mul(unity_ObjectToWorld, v.vertex);       //变换顶点位置 OS>WS
                o.nDirWS = UnityObjectToWorldNormal( v.normal );    //变换法线方向 OS>WS
                return o;                                           //输出数据结构
            }
            // 输出结构>>>像素Shader
            float4 frag(VertexOutput i) : COLOR {                   //只能是float4或half4
                //准备向量
                float3 lDir = _WorldSpaceLightPos0.xyz;
                float3 nDir = normalize(i.nDirWS);
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float3 rDir = reflect(lDir*(-1.0), nDir);
                //向量点积
                float3 rDotv = dot(rDir, vDir);
                float3 ndotl = dot(nDir, lDir);
                //光照模型
                float3 Phong = pow(max(0.0, rDotv), _SpecularPow);
                float3 Lambert = max(0.0, ndotl);
                float3 FinalColor = Phong + Lambert;

                return float4(FinalColor,1.0);         //最终输出颜色，只能是float4，float等也可以只不过会自行转换
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
