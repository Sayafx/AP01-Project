// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33892,y:34707,varname:node_3138,prsc:2|emission-5240-OUT,alpha-8462-OUT;n:type:ShaderForge.SFN_Tex2d,id:2811,x:31715,y:32802,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_2811,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4136,x:31689,y:33585,ptovrint:False,ptlb:NormalTex,ptin:_NormalTex,varname:node_4136,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Color,id:3727,x:31710,y:32626,ptovrint:False,ptlb:BaseCol,ptin:_BaseCol,varname:node_3727,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9,c2:0.9,c3:0.9,c4:1;n:type:ShaderForge.SFN_Multiply,id:6867,x:32042,y:32633,cmnt:BaseColor,varname:node_6867,prsc:2|A-3727-RGB,B-2811-RGB;n:type:ShaderForge.SFN_Transform,id:6347,x:31936,y:33585,cmnt:nDir,varname:node_6347,prsc:2,tffrom:2,tfto:0|IN-4136-RGB;n:type:ShaderForge.SFN_LightVector,id:5168,x:31798,y:33774,varname:node_5168,prsc:2;n:type:ShaderForge.SFN_Dot,id:8405,x:32198,y:33561,varname:node_8405,prsc:2,dt:0|A-6347-XYZ,B-5168-OUT;n:type:ShaderForge.SFN_Clamp01,id:6403,x:32395,y:33561,cmnt:Lambert,varname:node_6403,prsc:2|IN-8405-OUT;n:type:ShaderForge.SFN_Multiply,id:4338,x:32677,y:33235,varname:node_4338,prsc:2|A-6867-OUT,B-6403-OUT;n:type:ShaderForge.SFN_Multiply,id:335,x:32045,y:32886,varname:node_335,prsc:2|A-2811-RGB,B-6926-RGB;n:type:ShaderForge.SFN_Multiply,id:9455,x:32280,y:32886,cmnt:自发光,varname:node_9455,prsc:2|A-335-OUT,B-4090-OUT;n:type:ShaderForge.SFN_Slider,id:4090,x:31888,y:33088,ptovrint:False,ptlb:SelfIllumInt,ptin:_SelfIllumInt,varname:node_4090,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.7,cur:0.7,max:1.2;n:type:ShaderForge.SFN_Add,id:1745,x:34894,y:33064,cmnt:加上自发光,varname:node_1745,prsc:2|A-9455-OUT,B-8828-OUT;n:type:ShaderForge.SFN_Reflect,id:5347,x:32244,y:33770,cmnt:rDIr,varname:node_5347,prsc:2|A-9362-OUT,B-6347-XYZ;n:type:ShaderForge.SFN_ViewVector,id:6290,x:32244,y:33925,varname:node_6290,prsc:2;n:type:ShaderForge.SFN_Dot,id:8894,x:32466,y:33806,cmnt:rdotv,varname:node_8894,prsc:2,dt:0|A-5347-OUT,B-6290-OUT;n:type:ShaderForge.SFN_Clamp01,id:1560,x:32709,y:33806,cmnt:Phong,varname:node_1560,prsc:2|IN-8894-OUT;n:type:ShaderForge.SFN_Multiply,id:9694,x:33308,y:33816,varname:node_9694,prsc:2|A-8600-OUT,B-7834-RGB;n:type:ShaderForge.SFN_Power,id:8600,x:32976,y:33813,varname:node_8600,prsc:2|VAL-1560-OUT,EXP-5703-OUT;n:type:ShaderForge.SFN_Slider,id:5579,x:32303,y:34133,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_5579,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:30,max:90;n:type:ShaderForge.SFN_Slider,id:3239,x:33879,y:33792,ptovrint:False,ptlb:SpecInt,ptin:_SpecInt,varname:node_3239,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:10;n:type:ShaderForge.SFN_Tex2d,id:3709,x:32460,y:34224,ptovrint:False,ptlb:SpecPowTex,ptin:_SpecPowTex,varname:node_3709,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:9155,x:32460,y:34025,varname:node_9155,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:5703,x:32709,y:34039,varname:node_5703,prsc:2|A-9155-OUT,B-5579-OUT,T-3709-RGB;n:type:ShaderForge.SFN_Tex2d,id:4154,x:33308,y:33600,ptovrint:False,ptlb:BaseTintMask,ptin:_BaseTintMask,varname:node_4154,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6701,x:34245,y:33633,cmnt:FinalPhong,varname:node_6701,prsc:2|A-6785-OUT,B-3239-OUT;n:type:ShaderForge.SFN_Multiply,id:110,x:33722,y:33565,cmnt:BaseTintPhong,varname:node_110,prsc:2|A-6867-OUT,B-6248-OUT;n:type:ShaderForge.SFN_Add,id:8828,x:34687,y:33230,cmnt:直射光,varname:node_8828,prsc:2|A-4338-OUT,B-6701-OUT;n:type:ShaderForge.SFN_Fresnel,id:5394,x:33457,y:34473,varname:node_5394,prsc:2|NRM-6347-XYZ,EXP-9381-OUT;n:type:ShaderForge.SFN_Slider,id:9381,x:32993,y:34490,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_9381,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:3,max:30;n:type:ShaderForge.SFN_Add,id:5240,x:35140,y:33193,varname:node_5240,prsc:2|A-1745-OUT,B-8356-OUT;n:type:ShaderForge.SFN_Multiply,id:8356,x:33709,y:34251,varname:node_8356,prsc:2|A-5589-RGB,B-5394-OUT;n:type:ShaderForge.SFN_Tex2d,id:5589,x:33363,y:34253,ptovrint:False,ptlb:RimMask,ptin:_RimMask,varname:node_5589,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7834,x:32976,y:34022,ptovrint:False,ptlb:SpecMask,ptin:_SpecMask,varname:node_7834,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4563,x:33308,y:33987,ptovrint:False,ptlb:MetalMask,ptin:_MetalMask,varname:node_4563,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6248,x:33526,y:33596,varname:node_6248,prsc:2|A-4154-RGB,B-9694-OUT;n:type:ShaderForge.SFN_Add,id:6785,x:33958,y:33643,varname:node_6785,prsc:2|A-110-OUT,B-4397-OUT;n:type:ShaderForge.SFN_Tex2d,id:6926,x:31723,y:33010,ptovrint:False,ptlb:SelfIllTex,ptin:_SelfIllTex,varname:node_6926,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:1,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4397,x:33534,y:33877,varname:node_4397,prsc:2|A-9694-OUT,B-4563-RGB;n:type:ShaderForge.SFN_Multiply,id:9362,x:32007,y:33770,varname:node_9362,prsc:2|A-5168-OUT,B-7867-OUT;n:type:ShaderForge.SFN_Vector1,id:7867,x:31798,y:33919,varname:node_7867,prsc:2,v1:-1;n:type:ShaderForge.SFN_Lerp,id:8069,x:33550,y:34993,varname:node_8069,prsc:2|A-8462-OUT,B-8323-OUT,T-8323-OUT;n:type:ShaderForge.SFN_Vector1,id:8462,x:33140,y:34936,varname:node_8462,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:8323,x:32965,y:35350,varname:node_8323,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:9684,x:33140,y:35050,ptovrint:False,ptlb:node_9684,ptin:_node_9684,varname:node_9684,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:4327,x:33140,y:35190,varname:node_4327,prsc:2,uv:0,uaff:False;proporder:2811-4136-3727-7834-3709-4154-4563-5579-3239-5589-9381-6926-4090-9684;pass:END;sub:END;*/

Shader "Shader Forge/L11SF" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _NormalTex ("NormalTex", 2D) = "bump" {}
        _BaseCol ("BaseCol", Color) = (0.9,0.9,0.9,1)
        _SpecMask ("SpecMask", 2D) = "white" {}
        _SpecPowTex ("SpecPowTex", 2D) = "white" {}
        _BaseTintMask ("BaseTintMask", 2D) = "white" {}
        _MetalMask ("MetalMask", 2D) = "white" {}
        _SpecPow ("SpecPow", Range(1, 90)) = 30
        _SpecInt ("SpecInt", Range(1, 10)) = 1
        _RimMask ("RimMask", 2D) = "white" {}
        _FresnelPow ("FresnelPow", Range(1, 30)) = 3
        _SelfIllTex ("SelfIllTex", 2D) = "gray" {}
        _SelfIllumInt ("SelfIllumInt", Range(0.7, 1.2)) = 0.7
        _node_9684 ("node_9684", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalTex; uniform float4 _NormalTex_ST;
            uniform sampler2D _SpecPowTex; uniform float4 _SpecPowTex_ST;
            uniform sampler2D _BaseTintMask; uniform float4 _BaseTintMask_ST;
            uniform sampler2D _RimMask; uniform float4 _RimMask_ST;
            uniform sampler2D _SpecMask; uniform float4 _SpecMask_ST;
            uniform sampler2D _MetalMask; uniform float4 _MetalMask_ST;
            uniform sampler2D _SelfIllTex; uniform float4 _SelfIllTex_ST;
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 _SelfIllTex_var = tex2D(_SelfIllTex,TRANSFORM_TEX(i.uv0, _SelfIllTex));
                float _SelfIllumInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SelfIllumInt );
                float4 _BaseCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseCol );
                float3 node_6867 = (_BaseCol_var.rgb*_MainTex_var.rgb); // BaseColor
                float3 _NormalTex_var = UnpackNormal(tex2D(_NormalTex,TRANSFORM_TEX(i.uv0, _NormalTex)));
                float3 node_6347 = mul( _NormalTex_var.rgb, tangentTransform ).xyz; // nDir
                float4 _BaseTintMask_var = tex2D(_BaseTintMask,TRANSFORM_TEX(i.uv0, _BaseTintMask));
                float node_9155 = 1.0;
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float4 _SpecPowTex_var = tex2D(_SpecPowTex,TRANSFORM_TEX(i.uv0, _SpecPowTex));
                float4 _SpecMask_var = tex2D(_SpecMask,TRANSFORM_TEX(i.uv0, _SpecMask));
                float3 node_9694 = (pow(saturate(dot(reflect((lightDirection*(-1.0)),node_6347.rgb),viewDirection)),lerp(float3(node_9155,node_9155,node_9155),float3(_SpecPow_var,_SpecPow_var,_SpecPow_var),_SpecPowTex_var.rgb))*_SpecMask_var.rgb);
                float4 _MetalMask_var = tex2D(_MetalMask,TRANSFORM_TEX(i.uv0, _MetalMask));
                float _SpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecInt );
                float4 _RimMask_var = tex2D(_RimMask,TRANSFORM_TEX(i.uv0, _RimMask));
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float3 emissive = ((((_MainTex_var.rgb*_SelfIllTex_var.rgb)*_SelfIllumInt_var)+((node_6867*saturate(dot(node_6347.rgb,lightDirection)))+(((node_6867*(_BaseTintMask_var.rgb*node_9694))+(node_9694*_MetalMask_var.rgb))*_SpecInt_var)))+(_RimMask_var.rgb*pow(1.0-max(0,dot(node_6347.rgb, viewDirection)),_FresnelPow_var)));
                float3 finalColor = emissive;
                float node_8462 = 0.5;
                return fixed4(finalColor,node_8462);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalTex; uniform float4 _NormalTex_ST;
            uniform sampler2D _SpecPowTex; uniform float4 _SpecPowTex_ST;
            uniform sampler2D _BaseTintMask; uniform float4 _BaseTintMask_ST;
            uniform sampler2D _RimMask; uniform float4 _RimMask_ST;
            uniform sampler2D _SpecMask; uniform float4 _SpecMask_ST;
            uniform sampler2D _MetalMask; uniform float4 _MetalMask_ST;
            uniform sampler2D _SelfIllTex; uniform float4 _SelfIllTex_ST;
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
                float node_8462 = 0.5;
                return fixed4(finalColor * node_8462,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
