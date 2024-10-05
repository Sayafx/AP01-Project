Shader "VS/OldSchoolProL10"
{
    Properties {
        [Header(Texture)]
            _MainTex    ("RGB:基础颜色 A:环境遮罩" , 2D)  = "white" {}
            _NormTex    ("RGB:法线贴图" , 2D)            = "bump" {}
            _SpecTex    ("RGB:高光颜色 A:高光次幂" , 2D)  = "gray" {}
            _EmitTex    ("RGB:自发光贴图" , 2D)          = "black" {}
            _Cubemap    ("RGB:环境贴图" , cube)            = "_Skybox" {}
        [Header(Diffuse)]
            _MainCol    ("基本色（直射光色）", Color)       = (0.5, 0.5, 0.5, 1.0)
            _EnvUpCol   ("环境天光颜色", Color)             = (1.0, 1.0, 1.0, 1.0)
            _EnvSideCol ("环境侧面颜色", Color)             = (0.5, 0.5, 0.5, 1.0)
            _EnvDownCol ("环境底部颜色", Color)             = (0.0, 0.0, 0.0, 1.0)
            _EnvDiffInt ("环境漫反射强度", Range(0, 1))     = 0.2 
        [Header(Specular)]
            _SpecPow        ("高光次幂", Range(1,90))           = 30
            _FrensnelPow    ("菲尼尔次幂", Range(0,5))          = 1
            _EnvSpecInt     ("环境镜面反射强度", Range(0,1))     = 0.2
            _CubemapMip     ("环境球Mip", Range(0,7))           = 0
        [Header(Emission)]
            _EmitInt        ("自发光强度", Range(1,10))         =1
        
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
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0

            //输入参数
            //Texture
            uniform sampler2D _MainTex;
            uniform sampler2D _NormTex;
            uniform sampler2D _SpecTex;
            uniform sampler2D _EmitTex;
            uniform samplerCUBE _Cubemap;
            //Diffuse
            uniform float3 _MainCol;
            uniform float3 _EnvUpCol;
            uniform float3 _EnvSideCol;
            uniform float3 _EnvDownCol;
            uniform float _EnvDiffInt;
            //Specular
            uniform float _SpecPow;
            uniform float _FrensnelPow;
            uniform float _EnvSpecInt;
            uniform float _CubemapMip;
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
                LIGHTING_COORDS(5,6)
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
                //nDirWS
                float3 nDirTS = UnpackNormal(tex2D(_NormTex, i.uv0)).rgb;
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS, TBN));

                float3 lDir = _WorldSpaceLightPos0.xyz;
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float3 rDirWS = reflect(-lDir, nDirWS);

                //准备点积结果
                float3 ndotl = dot(nDirWS, lDir);
                float3 rdotv = dot(rDirWS, vDirWS);
                float3 vdotn = dot(vDirWS, nDirWS);

                //采样纹理
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float4 var_SpecTex = tex2D(_SpecTex, i.uv0);
                float3 var_EmitTex = tex2D(_EmitTex, i.uv0).rgb;
                float3 var_Cubemap = texCUBElod(_Cubemap, float4(nDirWS, lerp( _CubemapMip, 0.0, var_SpecTex.a))).rgb;

                //光照模型
                //光源部分
                float3 BaseCol = var_MainTex.rgb * _MainCol;
                float shadow = LIGHT_ATTENUATION(i);       // Unity 封装好的函数，可取出投影
                //Lambert
                float3 Lambert = max(0.0, ndotl);
                //Phong
                float SpecCol = var_SpecTex.rgb;
                float SpecPow = lerp(1, _SpecPow, var_SpecTex.a);
                float3 Phong = pow(max(0.0, rdotv), SpecPow);

                //光源部分整合
                float3 DirLighting = (Lambert * BaseCol + Phong * SpecCol) * shadow;

                //环境光部分
                //3ColAmbient
                float upMask = max(0.0, nDirWS.g);
                float downMask = max(0.0, -nDirWS.g);
                float sideMask = 1.0 - upMask - downMask;
                float3 envCol = upMask * _EnvUpCol + downMask * _EnvDownCol + sideMask * _EnvSideCol;

                float Fresnel = pow(max(0.0, 1.0 - vdotn), _FrensnelPow);
                float Occlusion = var_MainTex.a;
                
                float3 envLighting = (BaseCol * envCol * _EnvDiffInt + var_Cubemap * Fresnel * _EnvSpecInt * var_SpecTex.a) * Occlusion;

                //自发光部分
                float emitInt = _EmitInt * (sin(frac(_Time.z)) * 0.5 + 0.5);
                float3 emission = var_EmitTex * emitInt;

                //返回结果
                float3 finalRGB =  DirLighting + envLighting + emission;

                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}