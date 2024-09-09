// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33684,y:32743,varname:node_3138,prsc:2|emission-5884-OUT;n:type:ShaderForge.SFN_Tex2d,id:5399,x:31807,y:32860,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_5399,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:617,x:32038,y:32679,cmnt:nDirVS,varname:node_617,prsc:2,tffrom:2,tfto:3|IN-5399-RGB;n:type:ShaderForge.SFN_Transform,id:5912,x:32038,y:32860,varname:node_5912,prsc:2,tffrom:2,tfto:0|IN-5399-RGB;n:type:ShaderForge.SFN_ViewVector,id:7286,x:32038,y:33040,varname:node_7286,prsc:2;n:type:ShaderForge.SFN_Dot,id:7644,x:32315,y:32952,varname:node_7644,prsc:2,dt:0|A-5912-XYZ,B-7286-OUT;n:type:ShaderForge.SFN_OneMinus,id:5150,x:32510,y:32952,varname:node_5150,prsc:2|IN-7644-OUT;n:type:ShaderForge.SFN_Power,id:2181,x:32730,y:32952,varname:node_2181,prsc:2|VAL-5150-OUT,EXP-2562-OUT;n:type:ShaderForge.SFN_Slider,id:2562,x:32353,y:33154,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_2562,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_ComponentMask,id:6397,x:32268,y:32679,varname:node_6397,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-617-XYZ;n:type:ShaderForge.SFN_Multiply,id:3884,x:32481,y:32679,varname:node_3884,prsc:2|A-6397-OUT,B-5286-OUT;n:type:ShaderForge.SFN_Vector1,id:5286,x:32268,y:32860,varname:node_5286,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:25,x:32695,y:32679,cmnt:uv,varname:node_25,prsc:2|A-3884-OUT,B-5286-OUT;n:type:ShaderForge.SFN_Tex2d,id:2345,x:32881,y:32679,ptovrint:False,ptlb:Matcap,ptin:_Matcap,varname:node_2345,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:85c5562f4cbc9d243b762df8a526bb0b,ntxv:1,isnm:False|UVIN-25-OUT;n:type:ShaderForge.SFN_Multiply,id:3278,x:33089,y:32846,varname:node_3278,prsc:2|A-2345-RGB,B-2181-OUT;n:type:ShaderForge.SFN_Slider,id:3769,x:32996,y:33030,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_3769,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:5;n:type:ShaderForge.SFN_Multiply,id:5884,x:33397,y:32845,varname:node_5884,prsc:2|A-3278-OUT,B-3769-OUT;proporder:5399-2562-2345-3769;pass:END;sub:END;*/

Shader "Shader Forge/MatcapSF" {
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform sampler2D _Matcap; uniform float4 _Matcap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
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
                float node_5286 = 0.5;
                float2 node_25 = ((mul( UNITY_MATRIX_V, float4(mul( _NormalMap_var.rgb, tangentTransform ),0) ).xyz.rgb.rg*node_5286)+node_5286); // uv
                float4 _Matcap_var = tex2D(_Matcap,TRANSFORM_TEX(node_25, _Matcap));
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float3 emissive = ((_Matcap_var.rgb*pow((1.0 - dot(mul( _NormalMap_var.rgb, tangentTransform ).xyz.rgb,viewDirection)),_FresnelPow_var))*_EnvSpecInt_var);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
