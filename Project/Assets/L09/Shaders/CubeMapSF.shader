// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33279,y:32728,varname:node_3138,prsc:2|emission-4519-OUT;n:type:ShaderForge.SFN_ViewVector,id:8729,x:31880,y:32728,varname:node_8729,prsc:2;n:type:ShaderForge.SFN_Vector1,id:870,x:31880,y:32873,varname:node_870,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:7453,x:32084,y:32781,varname:node_7453,prsc:2|A-8729-OUT,B-870-OUT;n:type:ShaderForge.SFN_Tex2d,id:8930,x:31807,y:32980,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_8930,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:cb6c5165ed180c543be39ed70e72abc8,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:749,x:31992,y:32979,cmnt:nDIrWS,varname:node_749,prsc:2,tffrom:2,tfto:0|IN-8930-RGB;n:type:ShaderForge.SFN_Reflect,id:6117,x:32303,y:32781,varname:node_6117,prsc:2|A-7453-OUT,B-749-XYZ;n:type:ShaderForge.SFN_Cubemap,id:5828,x:32566,y:32779,ptovrint:False,ptlb:Cubemap,ptin:_Cubemap,varname:node_5828,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:a6bbd8ea44aa1a74d84986d3bc6b4570,pvfc:0|DIR-6117-OUT,MIP-243-OUT;n:type:ShaderForge.SFN_Slider,id:243,x:32224,y:32956,ptovrint:False,ptlb:CubemapMip,ptin:_CubemapMip,varname:node_243,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:7;n:type:ShaderForge.SFN_Fresnel,id:5928,x:32381,y:33064,varname:node_5928,prsc:2|NRM-749-XYZ,EXP-1839-OUT;n:type:ShaderForge.SFN_Slider,id:1839,x:31937,y:33202,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_1839,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:196,x:32784,y:32964,varname:node_196,prsc:2|A-5828-RGB,B-5928-OUT;n:type:ShaderForge.SFN_Multiply,id:4519,x:32992,y:32964,varname:node_4519,prsc:2|A-196-OUT,B-6046-OUT;n:type:ShaderForge.SFN_Slider,id:6046,x:32627,y:33128,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_6046,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;proporder:8930-5828-243-1839-6046;pass:END;sub:END;*/

Shader "Shader Forge/CubeMapSF" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _Cubemap ("Cubemap", Cube) = "_Skybox" {}
        _CubemapMip ("CubemapMip", Range(0, 7)) = 0
        _FresnelPow ("FresnelPow", Range(0, 10)) = 1
        _EnvSpecInt ("EnvSpecInt", Range(0, 5)) = 1
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform samplerCUBE _Cubemap;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _CubemapMip)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
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
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 node_749 = mul( _NormalMap_var.rgb, tangentTransform ).xyz; // nDIrWS
                float _CubemapMip_var = UNITY_ACCESS_INSTANCED_PROP( Props, _CubemapMip );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float3 emissive = ((texCUBElod(_Cubemap,float4(reflect((viewDirection*(-1.0)),node_749.rgb),_CubemapMip_var)).rgb*pow(1.0-max(0,dot(node_749.rgb, viewDirection)),_FresnelPow_var))*_EnvSpecInt_var);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
