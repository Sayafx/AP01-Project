// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34286,y:32225,varname:node_3138,prsc:2|emission-1470-OUT;n:type:ShaderForge.SFN_NormalVector,id:2410,x:31816,y:32922,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:7620,x:32017,y:32922,varname:node_7620,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-2410-OUT;n:type:ShaderForge.SFN_Multiply,id:2909,x:32209,y:33112,varname:node_2909,prsc:2|A-7620-OUT,B-3392-OUT;n:type:ShaderForge.SFN_Vector1,id:3392,x:32026,y:33186,varname:node_3392,prsc:2,v1:-1;n:type:ShaderForge.SFN_Clamp01,id:5462,x:32209,y:32922,cmnt:UpMask,varname:node_5462,prsc:2|IN-7620-OUT;n:type:ShaderForge.SFN_Clamp01,id:846,x:32407,y:33112,cmnt:BottomMask,varname:node_846,prsc:2|IN-2909-OUT;n:type:ShaderForge.SFN_Subtract,id:3281,x:32407,y:33272,varname:node_3281,prsc:2|A-1971-OUT,B-5462-OUT;n:type:ShaderForge.SFN_Vector1,id:1971,x:32209,y:33272,varname:node_1971,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:866,x:32597,y:33272,varname:node_866,prsc:2|A-3281-OUT,B-846-OUT;n:type:ShaderForge.SFN_Clamp01,id:720,x:32782,y:33272,cmnt:SideMask,varname:node_720,prsc:2|IN-866-OUT;n:type:ShaderForge.SFN_Color,id:7017,x:32209,y:32751,ptovrint:False,ptlb:UpColor,ptin:_UpColor,varname:node_7017,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.369571,c2:0.4787563,c3:0.5188679,c4:1;n:type:ShaderForge.SFN_Color,id:2217,x:32597,y:32984,ptovrint:False,ptlb:BottomColor,ptin:_BottomColor,varname:node_2217,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4433962,c2:0.4050511,c3:0.361828,c4:1;n:type:ShaderForge.SFN_Color,id:7041,x:32782,y:33441,ptovrint:False,ptlb:SideColor,ptin:_SideColor,varname:node_7041,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7830189,c2:0.7830189,c3:0.7830189,c4:1;n:type:ShaderForge.SFN_Multiply,id:2831,x:32407,y:32922,varname:node_2831,prsc:2|A-7017-RGB,B-5462-OUT;n:type:ShaderForge.SFN_Multiply,id:9574,x:32782,y:33091,varname:node_9574,prsc:2|A-2217-RGB,B-846-OUT;n:type:ShaderForge.SFN_Multiply,id:5606,x:32973,y:33272,varname:node_5606,prsc:2|A-720-OUT,B-7041-RGB;n:type:ShaderForge.SFN_Add,id:622,x:32967,y:32955,varname:node_622,prsc:2|A-2831-OUT,B-9574-OUT;n:type:ShaderForge.SFN_Add,id:1529,x:33165,y:33100,varname:node_1529,prsc:2|A-622-OUT,B-5606-OUT;n:type:ShaderForge.SFN_Tex2d,id:4872,x:33373,y:32777,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,varname:node_4872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1f36af5d1a8d1dd4f8d5171529cbd83e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4489,x:33583,y:32868,cmnt:3ColorOcclusion,varname:node_4489,prsc:2|A-4872-RGB,B-7549-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:2617,x:32113,y:31751,varname:node_2617,prsc:2;n:type:ShaderForge.SFN_LightVector,id:7366,x:32113,y:31932,varname:node_7366,prsc:2;n:type:ShaderForge.SFN_Dot,id:8732,x:32333,y:31851,varname:node_8732,prsc:2,dt:0|A-2617-OUT,B-7366-OUT;n:type:ShaderForge.SFN_Clamp01,id:6367,x:32526,y:31851,varname:node_6367,prsc:2|IN-8732-OUT;n:type:ShaderForge.SFN_Slider,id:4355,x:32369,y:32066,ptovrint:False,ptlb:高光次幂,ptin:_,varname:node_4355,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:10,cur:10,max:30;n:type:ShaderForge.SFN_Power,id:3526,x:32733,y:31851,cmnt:phong,varname:node_3526,prsc:2|VAL-6367-OUT,EXP-4355-OUT;n:type:ShaderForge.SFN_Dot,id:1121,x:32362,y:32378,varname:node_1121,prsc:2,dt:0|A-7366-OUT,B-2410-OUT;n:type:ShaderForge.SFN_Clamp01,id:1105,x:32593,y:32378,cmnt:Lambert,varname:node_1105,prsc:2|IN-1121-OUT;n:type:ShaderForge.SFN_Add,id:5008,x:33025,y:32163,varname:node_5008,prsc:2|A-3526-OUT,B-2072-OUT;n:type:ShaderForge.SFN_Color,id:3423,x:33025,y:31975,ptovrint:False,ptlb:LightColor,ptin:_LightColor,varname:node_3423,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8584906,c2:0.6681648,c3:0.7958517,c4:1;n:type:ShaderForge.SFN_LightAttenuation,id:2174,x:33237,y:31914,varname:node_2174,prsc:2;n:type:ShaderForge.SFN_Add,id:1470,x:33842,y:32437,varname:node_1470,prsc:2|A-6359-OUT,B-4489-OUT;n:type:ShaderForge.SFN_Color,id:6446,x:32593,y:32204,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:node_6446,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2072,x:32840,y:32338,varname:node_2072,prsc:2|A-6446-RGB,B-1105-OUT;n:type:ShaderForge.SFN_Multiply,id:7549,x:33373,y:32961,varname:node_7549,prsc:2|A-6446-RGB,B-1529-OUT;n:type:ShaderForge.SFN_Multiply,id:4892,x:33275,y:32093,varname:node_4892,prsc:2|A-3423-RGB,B-5008-OUT;n:type:ShaderForge.SFN_Multiply,id:6359,x:33481,y:32010,varname:node_6359,prsc:2|A-2174-OUT,B-4892-OUT;proporder:7017-2217-7041-4872-4355-3423-6446;pass:END;sub:END;*/

Shader "Shader Forge/OldSchoolPlusSF" {
    Properties {
        _UpColor ("UpColor", Color) = (0.369571,0.4787563,0.5188679,1)
        _BottomColor ("BottomColor", Color) = (0.4433962,0.4050511,0.361828,1)
        _SideColor ("SideColor", Color) = (0.7830189,0.7830189,0.7830189,1)
        _Occlusion ("Occlusion", 2D) = "white" {}
        _ ("高光次幂", Range(10, 30)) = 10
        _LightColor ("LightColor", Color) = (0.8584906,0.6681648,0.7958517,1)
        _BaseColor ("BaseColor", Color) = (0.5,0.5,0.5,1)
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _UpColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BottomColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SideColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseColor)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _LightColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightColor );
                float __var = UNITY_ACCESS_INSTANCED_PROP( Props, _ );
                float4 _BaseColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseColor );
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion));
                float4 _UpColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _UpColor );
                float node_7620 = i.normalDir.g;
                float node_5462 = saturate(node_7620); // UpMask
                float4 _BottomColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BottomColor );
                float node_846 = saturate((node_7620*(-1.0))); // BottomMask
                float4 _SideColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SideColor );
                float3 emissive = ((attenuation*(_LightColor_var.rgb*(pow(saturate(dot(viewReflectDirection,lightDirection)),__var)+(_BaseColor_var.rgb*saturate(dot(lightDirection,i.normalDir))))))+(_Occlusion_var.rgb*(_BaseColor_var.rgb*(((_UpColor_var.rgb*node_5462)+(_BottomColor_var.rgb*node_846))+(saturate(((1.0-node_5462)-node_846))*_SideColor_var.rgb)))));
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _UpColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BottomColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SideColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseColor)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
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
