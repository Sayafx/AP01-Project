Shader "VS/HalfLambert"
{
    Properties {
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

            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 输入模型的顶点信息
                float3 normal : NORMAL;     // 输入模型的法线信息
            };

            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 由模型顶点信息换算而来的顶点屏幕位置
                float3 nDirWS : TEXCOORD0;      // 由模型法线信息换算而来的世界空间法线信息
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                   //新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );           //变换顶点信息，并将它塞给数据结构
                o.nDirWS = UnityObjectToWorldNormal( v.normal );    //变换法线信息，并将它塞给数据结构
                return o;                                           //输出数据结构
            }
            // 输出结构>>>像素Shader
            float4 frag(VertexOutput i) : COLOR {                                    //只能是float4或half4
                float3 nDir = i.nDirWS;                                              //获取nDir
                float3 lDir = _WorldSpaceLightPos0.xyz;                              //获取lDir
                float nDotl = dot( nDir, lDir );                                     //nDir点积lDir
                float HalfLambert = max( 0.0, nDotl * 0.5 + 0.5 );                   //转换为半兰伯特并截断负值
                return float4( HalfLambert, HalfLambert, HalfLambert, 1.0 );         //最终输出颜色，只能是float4，float等也可以只不过会自行转换
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
