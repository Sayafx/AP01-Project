// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:35875,y:33105,varname:node_3138,prsc:2|emission-5240-OUT;n:type:ShaderForge.SFN_Tex2d,id:2811,x:31786,y:32827,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_2811,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4136,x:31760,y:33610,ptovrint:False,ptlb:NormalTex,ptin:_NormalTex,varname:node_4136,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Color,id:3727,x:31781,y:32651,ptovrint:False,ptlb:BaseCol,ptin:_BaseCol,varname:node_3727,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9,c2:0.9,c3:0.9,c4:1;n:type:ShaderForge.SFN_Multiply,id:6867,x:32113,y:32658,cmnt:BaseColor,varname:node_6867,prsc:2|A-3727-RGB,B-2811-RGB;n:type:ShaderForge.SFN_Transform,id:6347,x:32007,y:33610,cmnt:nDir,varname:node_6347,prsc:2,tffrom:2,tfto:0|IN-4136-RGB;n:type:ShaderForge.SFN_LightVector,id:5168,x:31869,y:33799,varname:node_5168,prsc:2;n:type:ShaderForge.SFN_Dot,id:8405,x:32269,y:33586,varname:node_8405,prsc:2,dt:0|A-6347-XYZ,B-5168-OUT;n:type:ShaderForge.SFN_Clamp01,id:6403,x:32466,y:33586,cmnt:Lambert,varname:node_6403,prsc:2|IN-8405-OUT;n:type:ShaderForge.SFN_Multiply,id:4338,x:32748,y:33260,varname:node_4338,prsc:2|A-6867-OUT,B-6403-OUT;n:type:ShaderForge.SFN_Multiply,id:335,x:32116,y:32911,varname:node_335,prsc:2|A-2811-RGB,B-2811-A;n:type:ShaderForge.SFN_Multiply,id:9455,x:32351,y:32911,cmnt:自发光,varname:node_9455,prsc:2|A-335-OUT,B-4090-OUT;n:type:ShaderForge.SFN_Slider,id:4090,x:31959,y:33113,ptovrint:False,ptlb:SelfIllumInt,ptin:_SelfIllumInt,varname:node_4090,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.7,cur:0.7,max:1.2;n:type:ShaderForge.SFN_Add,id:1745,x:35360,y:32894,cmnt:加上自发光,varname:node_1745,prsc:2|A-9455-OUT,B-8828-OUT;n:type:ShaderForge.SFN_Reflect,id:5347,x:32315,y:33795,cmnt:rDIr,varname:node_5347,prsc:2|A-9362-OUT,B-6347-XYZ;n:type:ShaderForge.SFN_ViewVector,id:6290,x:32315,y:33950,varname:node_6290,prsc:2;n:type:ShaderForge.SFN_Dot,id:8894,x:32537,y:33831,cmnt:rdotv,varname:node_8894,prsc:2,dt:0|A-5347-OUT,B-6290-OUT;n:type:ShaderForge.SFN_Clamp01,id:1560,x:32780,y:33831,cmnt:Phong,varname:node_1560,prsc:2|IN-8894-OUT;n:type:ShaderForge.SFN_Multiply,id:9694,x:33362,y:33850,cmnt:SpecMask,varname:node_9694,prsc:2|A-8600-OUT,B-7834-R;n:type:ShaderForge.SFN_Power,id:8600,x:33047,y:33838,varname:node_8600,prsc:2|VAL-1560-OUT,EXP-5703-OUT;n:type:ShaderForge.SFN_Slider,id:5579,x:32374,y:34158,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_5579,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:30,max:90;n:type:ShaderForge.SFN_Slider,id:3239,x:33950,y:33817,ptovrint:False,ptlb:SpecInt,ptin:_SpecInt,varname:node_3239,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:10;n:type:ShaderForge.SFN_Vector1,id:9155,x:32531,y:34050,varname:node_9155,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:5703,x:32780,y:34064,varname:node_5703,prsc:2|A-9155-OUT,B-5579-OUT,T-7834-G;n:type:ShaderForge.SFN_Multiply,id:6701,x:34316,y:33658,cmnt:FinalPhong,varname:node_6701,prsc:2|A-6785-OUT,B-3239-OUT;n:type:ShaderForge.SFN_Multiply,id:110,x:33793,y:33590,cmnt:BaseTintPhong,varname:node_110,prsc:2|A-6867-OUT,B-6248-OUT;n:type:ShaderForge.SFN_Add,id:8828,x:34617,y:33260,cmnt:直射光,varname:node_8828,prsc:2|A-4338-OUT,B-6701-OUT;n:type:ShaderForge.SFN_Fresnel,id:5394,x:33528,y:34498,varname:node_5394,prsc:2|NRM-6347-XYZ,EXP-9381-OUT;n:type:ShaderForge.SFN_Slider,id:9381,x:33064,y:34515,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_9381,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:3,max:30;n:type:ShaderForge.SFN_Add,id:5240,x:35603,y:33215,varname:node_5240,prsc:2|A-1745-OUT,B-8356-OUT;n:type:ShaderForge.SFN_Multiply,id:8356,x:33780,y:34276,varname:node_8356,prsc:2|A-5589-RGB,B-5394-OUT;n:type:ShaderForge.SFN_Tex2d,id:5589,x:33434,y:34278,ptovrint:False,ptlb:RimMask,ptin:_RimMask,varname:node_5589,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7834,x:32503,y:34282,ptovrint:False,ptlb:SpecTex,ptin:_SpecTex,varname:node_7834,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6248,x:33597,y:33621,varname:node_6248,prsc:2|A-7834-A,B-9694-OUT;n:type:ShaderForge.SFN_Add,id:6785,x:34029,y:33668,varname:node_6785,prsc:2|A-110-OUT,B-4397-OUT;n:type:ShaderForge.SFN_Multiply,id:4397,x:33605,y:33902,cmnt:MetalMask,varname:node_4397,prsc:2|A-9694-OUT,B-7834-B;n:type:ShaderForge.SFN_Multiply,id:9362,x:32078,y:33795,varname:node_9362,prsc:2|A-5168-OUT,B-7867-OUT;n:type:ShaderForge.SFN_Vector1,id:7867,x:31869,y:33944,varname:node_7867,prsc:2,v1:-1;n:type:ShaderForge.SFN_LightAttenuation,id:1008,x:34875,y:32962,varname:node_1008,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3157,x:34885,y:33147,varname:node_3157,prsc:2|A-6767-RGB,B-8828-OUT;n:type:ShaderForge.SFN_Color,id:6767,x:34600,y:33014,ptovrint:False,ptlb:LightColor,ptin:_LightColor,varname:node_6767,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:4227,x:35111,y:33129,varname:node_4227,prsc:2|A-1008-OUT,B-3157-OUT;proporder:2811-4136-3727-7834-5579-3239-5589-9381-4090-6767;pass:END;sub:END;*/

Shader "Shader Forge/L11SF" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _NormalTex ("NormalTex", 2D) = "bump" {}
        _BaseCol ("BaseCol", Color) = (0.9,0.9,0.9,1)
        _SpecTex ("SpecTex", 2D) = "white" {}
        _SpecPow ("SpecPow", Range(1, 90)) = 30
        _SpecInt ("SpecInt", Range(1, 10)) = 1
        _RimMask ("RimMask", 2D) = "white" {}
        _FresnelPow ("FresnelPow", Range(1, 30)) = 3
        _SelfIllumInt ("SelfIllumInt", Range(0.7, 1.2)) = 0.7
        _LightColor ("LightColor", Color) = (1,1,1,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalTex; uniform float4 _NormalTex_ST;
            uniform sampler2D _RimMask; uniform float4 _RimMask_ST;
            uniform sampler2D _SpecTex; uniform float4 _SpecTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SelfIllumInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
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
////// Emissive:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float _SelfIllumInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SelfIllumInt );
                float4 _BaseCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseCol );
                float3 node_6867 = (_BaseCol_var.rgb*_MainTex_var.rgb); // BaseColor
                float3 _NormalTex_var = UnpackNormal(tex2D(_NormalTex,TRANSFORM_TEX(i.uv0, _NormalTex)));
                float3 node_6347 = mul( _NormalTex_var.rgb, tangentTransform ).xyz; // nDir
                float4 _SpecTex_var = tex2D(_SpecTex,TRANSFORM_TEX(i.uv0, _SpecTex));
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float node_9694 = (pow(saturate(dot(reflect((lightDirection*(-1.0)),node_6347.rgb),viewDirection)),lerp(1.0,_SpecPow_var,_SpecTex_var.g))*_SpecTex_var.r); // SpecMask
                float _SpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecInt );
                float3 node_8828 = ((node_6867*saturate(dot(node_6347.rgb,lightDirection)))+(((node_6867*(_SpecTex_var.a*node_9694))+(node_9694*_SpecTex_var.b))*_SpecInt_var)); // 直射光
                float4 _RimMask_var = tex2D(_RimMask,TRANSFORM_TEX(i.uv0, _RimMask));
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float3 emissive = ((((_MainTex_var.rgb*_MainTex_var.a)*_SelfIllumInt_var)+node_8828)+(_RimMask_var.rgb*pow(1.0-max(0,dot(node_6347.rgb, viewDirection)),_FresnelPow_var)));
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalTex; uniform float4 _NormalTex_ST;
            uniform sampler2D _RimMask; uniform float4 _RimMask_ST;
            uniform sampler2D _SpecTex; uniform float4 _SpecTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SelfIllumInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
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
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
