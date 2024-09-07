Shader "VS/NormalTexture"
{
    Properties {
        _NormalMap ("法线贴图", 2D) = "bump" {}
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

            //输入参数  在 Properties 里声明的要在这里引入
            uniform sampler2D _NormalMap;

            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 顶点信息
                float3 normal : NORMAL;     // 法线信息
                float4 tangent : TANGENT;   //构建切线空间需要的模型切线信息
                float2 uv0 : TEXCOORD0;     // 需要 uv 坐标，采样法线贴图
            };

            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 由模型顶点信息换算而来的顶点屏幕位置
                float2 uv0 : TEXCOORD0;         // UV信息
                float3 tDirWS : TEXCOORD1;
                float3 bDirWS : TEXCOORD2;
                float3 nDirWS : TEXCOORD3;
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                   //新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );           //变换顶点信息，并将它塞给数据结构
                o.uv0 = v.uv0;
                o.nDirWS = UnityObjectToWorldNormal( v.normal );    //世界空间法线信息
                o.tDirWS = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);
                return o;                                           //输出数据结构
            }
            // 输出结构>>>像素Shader
            float4 frag(VertexOutput i) : COLOR {                   //只能是float4或half4
                //获取 nDir
                float3 var_NormalMap = UnpackNormal(tex2D( _NormalMap , i.uv0));  //采样法线纹理并解码 切线空间 nDir
                float3x3 TBN = float3x3 ( i.tDirWS , i.bDirWS , i.nDirWS );              //构建 TBN 矩阵
                float3 nDir = normalize(mul( var_NormalMap , TBN ));            //世界空间 nDir ，做矩阵变换，需要变换的在前面
                //获取lDir
                float3 lDir = _WorldSpaceLightPos0.xyz;
                //Lambert
                float nDotl = dot(nDir,lDir);                       //nDir点积lDir
                float Lambert = max(0.0,nDotl);                     //截断负值 
                return float4(Lambert,Lambert,Lambert,1.0);         //最终输出颜色，只能是float4，float等也可以只不过会自行转换
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
