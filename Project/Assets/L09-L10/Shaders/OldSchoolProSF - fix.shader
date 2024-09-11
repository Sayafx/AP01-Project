// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33586,y:31743,varname:node_3138,prsc:2|emission-9436-OUT;n:type:ShaderForge.SFN_ComponentMask,id:4944,x:30450,y:31976,varname:node_4944,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-9197-XYZ;n:type:ShaderForge.SFN_Multiply,id:681,x:30642,y:32166,varname:node_681,prsc:2|A-4944-OUT,B-4503-OUT;n:type:ShaderForge.SFN_Vector1,id:4503,x:30459,y:32240,varname:node_4503,prsc:2,v1:-1;n:type:ShaderForge.SFN_Clamp01,id:9418,x:30642,y:31976,cmnt:UpMask,varname:node_9418,prsc:2|IN-4944-OUT;n:type:ShaderForge.SFN_Clamp01,id:1358,x:30840,y:32166,cmnt:BottomMask,varname:node_1358,prsc:2|IN-681-OUT;n:type:ShaderForge.SFN_Subtract,id:4964,x:30840,y:32326,varname:node_4964,prsc:2|A-8055-OUT,B-9418-OUT;n:type:ShaderForge.SFN_Vector1,id:8055,x:30642,y:32326,varname:node_8055,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:7822,x:31030,y:32326,varname:node_7822,prsc:2|A-4964-OUT,B-1358-OUT;n:type:ShaderForge.SFN_Clamp01,id:3583,x:31215,y:32326,cmnt:SideMask,varname:node_3583,prsc:2|IN-7822-OUT;n:type:ShaderForge.SFN_Color,id:8394,x:30642,y:31805,ptovrint:False,ptlb:UpColor,ptin:_UpColor,varname:node_7017,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.369571,c2:0.4787563,c3:0.5188679,c4:1;n:type:ShaderForge.SFN_Color,id:2225,x:30840,y:31805,ptovrint:False,ptlb:BottomColor,ptin:_BottomColor,varname:node_2217,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4433962,c2:0.4050511,c3:0.361828,c4:1;n:type:ShaderForge.SFN_Color,id:5387,x:31215,y:32491,ptovrint:False,ptlb:SideColor,ptin:_SideColor,varname:node_7041,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7830189,c2:0.7830189,c3:0.7830189,c4:1;n:type:ShaderForge.SFN_Multiply,id:5457,x:30840,y:31976,varname:node_5457,prsc:2|A-8394-RGB,B-9418-OUT;n:type:ShaderForge.SFN_Multiply,id:4857,x:31030,y:32166,varname:node_4857,prsc:2|A-2225-RGB,B-1358-OUT;n:type:ShaderForge.SFN_Multiply,id:1606,x:31406,y:32326,varname:node_1606,prsc:2|A-3583-OUT,B-5387-RGB;n:type:ShaderForge.SFN_Add,id:1726,x:31406,y:32154,varname:node_1726,prsc:2|A-5457-OUT,B-4857-OUT;n:type:ShaderForge.SFN_Add,id:1001,x:31725,y:32158,cmnt:混合三重环境光,varname:node_1001,prsc:2|A-1726-OUT,B-1606-OUT;n:type:ShaderForge.SFN_Tex2d,id:1711,x:32429,y:32361,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,cmnt:环境遮挡,varname:node_4872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1f36af5d1a8d1dd4f8d5171529cbd83e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8448,x:32711,y:32463,cmnt:环境部分结果,varname:node_8448,prsc:2|A-1711-RGB,B-1214-OUT;n:type:ShaderForge.SFN_LightVector,id:1669,x:29145,y:31983,cmnt:lDir,varname:node_1669,prsc:2;n:type:ShaderForge.SFN_Slider,id:3866,x:30465,y:31212,ptovrint:False,ptlb:高光次幂,ptin:_,varname:node_4355,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:30,max:90;n:type:ShaderForge.SFN_Power,id:8714,x:30841,y:31131,cmnt:Phong Specular,varname:node_8714,prsc:2|VAL-4698-OUT,EXP-3866-OUT;n:type:ShaderForge.SFN_Add,id:8739,x:31138,y:31276,varname:node_8739,prsc:2|A-8714-OUT,B-1222-OUT;n:type:ShaderForge.SFN_Color,id:5145,x:31138,y:31097,ptovrint:False,ptlb:LightColor,ptin:_LightColor,cmnt:LightColor,varname:node_3423,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_LightAttenuation,id:8193,x:31347,y:31097,cmnt:光源遮挡,varname:node_8193,prsc:2;n:type:ShaderForge.SFN_Add,id:9436,x:33019,y:31946,varname:node_9436,prsc:2|A-9289-OUT,B-8448-OUT;n:type:ShaderForge.SFN_Color,id:5564,x:30622,y:31359,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:node_6446,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:1222,x:30842,y:31470,cmnt:Lambert Diffuse,varname:node_1222,prsc:2|A-5564-RGB,B-878-OUT;n:type:ShaderForge.SFN_Multiply,id:7582,x:31347,y:31256,varname:node_7582,prsc:2|A-5145-RGB,B-8739-OUT;n:type:ShaderForge.SFN_Multiply,id:9289,x:31550,y:31238,cmnt:光源部分混合,varname:node_9289,prsc:2|A-8193-OUT,B-7582-OUT;n:type:ShaderForge.SFN_ViewVector,id:7596,x:28928,y:31448,cmnt:vDIr,varname:node_7596,prsc:2;n:type:ShaderForge.SFN_Vector1,id:796,x:28966,y:31620,varname:node_796,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:3042,x:29203,y:31520,varname:node_3042,prsc:2|A-7596-OUT,B-796-OUT;n:type:ShaderForge.SFN_Tex2d,id:5789,x:28928,y:31722,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_8930,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:cb6c5165ed180c543be39ed70e72abc8,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:9197,x:29165,y:31722,cmnt:nDIrWS,varname:node_9197,prsc:2,tffrom:2,tfto:0|IN-5789-RGB;n:type:ShaderForge.SFN_Reflect,id:4886,x:29435,y:31589,cmnt:vrDir,varname:node_4886,prsc:2|A-3042-OUT,B-9197-XYZ;n:type:ShaderForge.SFN_Cubemap,id:8466,x:31762,y:32710,ptovrint:False,ptlb:Cubemap,ptin:_Cubemap,varname:node_5828,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:a6bbd8ea44aa1a74d84986d3bc6b4570,pvfc:0|DIR-4886-OUT,MIP-1475-OUT;n:type:ShaderForge.SFN_Slider,id:1475,x:31431,y:32829,ptovrint:False,ptlb:CubemapMip,ptin:_CubemapMip,varname:node_243,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:7;n:type:ShaderForge.SFN_Fresnel,id:5725,x:31762,y:32912,varname:node_5725,prsc:2|NRM-9197-XYZ,EXP-1250-OUT;n:type:ShaderForge.SFN_Slider,id:1250,x:31431,y:32971,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_1839,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:9832,x:31978,y:32839,varname:node_9832,prsc:2|A-8466-RGB,B-5725-OUT;n:type:ShaderForge.SFN_Multiply,id:8391,x:32172,y:32839,cmnt:Cubemap EnvSpecular,varname:node_8391,prsc:2|A-9832-OUT,B-7336-OUT;n:type:ShaderForge.SFN_Slider,id:7336,x:31821,y:33080,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_6046,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_Reflect,id:5344,x:29397,y:31835,cmnt:rDir,varname:node_5344,prsc:2|A-1669-OUT,B-9197-XYZ;n:type:ShaderForge.SFN_Dot,id:8412,x:29910,y:31675,varname:node_8412,prsc:2,dt:0|A-9197-XYZ,B-1669-OUT;n:type:ShaderForge.SFN_Clamp01,id:878,x:30107,y:31675,cmnt:ndotl,varname:node_878,prsc:2|IN-8412-OUT;n:type:ShaderForge.SFN_Dot,id:2411,x:29920,y:31502,varname:node_2411,prsc:2,dt:0|A-7596-OUT,B-5344-OUT;n:type:ShaderForge.SFN_Clamp01,id:4698,x:30107,y:31502,cmnt:rdotv,varname:node_4698,prsc:2|IN-2411-OUT;n:type:ShaderForge.SFN_Add,id:1214,x:32427,y:32546,varname:node_1214,prsc:2|A-4141-OUT,B-8391-OUT;n:type:ShaderForge.SFN_Multiply,id:4141,x:32147,y:32140,cmnt:3Col Env Diffuse,varname:node_4141,prsc:2|A-1222-OUT,B-9517-OUT;n:type:ShaderForge.SFN_Multiply,id:9517,x:31934,y:32158,varname:node_9517,prsc:2|A-1001-OUT,B-2388-OUT;n:type:ShaderForge.SFN_Slider,id:2388,x:31568,y:32378,ptovrint:False,ptlb:EnvInt,ptin:_EnvInt,varname:node_2388,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:8394-2225-5387-1711-3866-5145-5564-5789-8466-1475-1250-7336-2388;pass:END;sub:END;*/

Shader "Shader Forge/OldSchoolProSF - fix" {
    Properties {
        _UpColor ("UpColor", Color) = (0.369571,0.4787563,0.5188679,1)
        _BottomColor ("BottomColor", Color) = (0.4433962,0.4050511,0.361828,1)
        _SideColor ("SideColor", Color) = (0.7830189,0.7830189,0.7830189,1)
        _Occlusion ("Occlusion", 2D) = "white" {}
        _ ("高光次幂", Range(1, 90)) = 30
        _LightColor ("LightColor", Color) = (1,1,1,1)
        _BaseColor ("BaseColor", Color) = (0.5,0.5,0.5,1)
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _Cubemap ("Cubemap", Cube) = "_Skybox" {}
        _CubemapMip ("CubemapMip", Range(0, 7)) = 0
        _FresnelPow ("FresnelPow", Range(0, 10)) = 1
        _EnvSpecInt ("EnvSpecInt", Range(0, 5)) = 1
        _EnvInt ("EnvInt", Range(0, 1)) = 0
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform samplerCUBE _Cubemap;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _UpColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BottomColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SideColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _CubemapMip)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _LightColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightColor ); // LightColor
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 node_9197 = mul( _NormalMap_var.rgb, tangentTransform ).xyz; // nDIrWS
                float __var = UNITY_ACCESS_INSTANCED_PROP( Props, _ );
                float4 _BaseColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseColor );
                float3 node_1222 = (_BaseColor_var.rgb*saturate(dot(node_9197.rgb,lightDirection))); // Lambert Diffuse
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion)); // 环境遮挡
                float4 _UpColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _UpColor );
                float node_4944 = node_9197.rgb.g;
                float node_9418 = saturate(node_4944); // UpMask
                float4 _BottomColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BottomColor );
                float node_1358 = saturate((node_4944*(-1.0))); // BottomMask
                float4 _SideColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SideColor );
                float _EnvInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvInt );
                float _CubemapMip_var = UNITY_ACCESS_INSTANCED_PROP( Props, _CubemapMip );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float3 emissive = ((attenuation*(_LightColor_var.rgb*(pow(saturate(dot(viewDirection,reflect(lightDirection,node_9197.rgb))),__var)+node_1222)))+(_Occlusion_var.rgb*((node_1222*((((_UpColor_var.rgb*node_9418)+(_BottomColor_var.rgb*node_1358))+(saturate(((1.0-node_9418)-node_1358))*_SideColor_var.rgb))*_EnvInt_var))+((texCUBElod(_Cubemap,float4(reflect((viewDirection*(-1.0)),node_9197.rgb),_CubemapMip_var)).rgb*pow(1.0-max(0,dot(node_9197.rgb, viewDirection)),_FresnelPow_var))*_EnvSpecInt_var))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform samplerCUBE _Cubemap;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _UpColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BottomColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SideColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _CubemapMip)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
