// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-7563-OUT;n:type:ShaderForge.SFN_LightVector,id:8985,x:31902,y:33015,varname:node_8985,prsc:2;n:type:ShaderForge.SFN_Dot,id:3945,x:32074,y:32901,varname:node_3945,prsc:2,dt:0|A-5072-OUT,B-8985-OUT;n:type:ShaderForge.SFN_NormalVector,id:3070,x:30968,y:32656,prsc:2,pt:False;n:type:ShaderForge.SFN_Tangent,id:5816,x:30968,y:32379,varname:node_5816,prsc:2;n:type:ShaderForge.SFN_Bitangent,id:4511,x:30968,y:32510,varname:node_4511,prsc:2;n:type:ShaderForge.SFN_Code,id:5072,x:31271,y:32717,varname:node_5072,prsc:2,code:ZgBsAG8AYQB0ADMAIABuAEQAaQByAFQAUwAgAD0AIABVAG4AcABhAGMAawBOAG8AcgBtAGEAbAAoAHQAZQB4ADIARAAoAG4AbwByAG0AYQBsAE0AYQBwACwAIAB1AHYAKQApADsACgBmAGwAbwBhAHQAMwB4ADMAIABUAEIATgAgAD0AIABmAGwAbwBhAHQAMwB4ADMAKAB0AEQAaQByACwAIABiAEQAaQByACwAIABuAEQAaQByACkAOwAKAGYAbABvAGEAdAAzACAAbgBEAGkAcgBXAFMAIAA9ACAAbgBvAHIAbQBhAGwAaQB6AGUAKABtAHUAbAAoAG4ARABpAHIAVABTACwAIABUAEIATgApACkAOwAKAHIAZQB0AHUAcgBuACAAbgBEAGkAcgBXAFMAOwA=,output:2,fname:Function_node_5072,width:676,height:277,input:2,input:2,input:2,input:12,input:1,input_1_label:tDir,input_2_label:bDir,input_3_label:nDir,input_4_label:normalMap,input_5_label:uv|A-5816-OUT,B-4511-OUT,C-3070-OUT,D-1058-TEX,E-9517-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9517,x:30968,y:33005,varname:node_9517,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Max,id:7563,x:32307,y:32901,varname:node_7563,prsc:2|A-3945-OUT,B-1283-OUT;n:type:ShaderForge.SFN_Vector1,id:1283,x:32074,y:33066,varname:node_1283,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2dAsset,id:1058,x:30968,y:32826,ptovrint:False,ptlb:node_1058,ptin:_node_1058,varname:node_1058,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Code,id:9843,x:32268,y:33384,varname:node_9843,prsc:2,code:,output:2,fname:Function_node_5072,width:676,height:277,input:2,input:2,input:2,input:1,input:2,input:1,input_1_label:tDIr,input_2_label:bDir,input_3_label:nDIr,input_4_label:uv,input_5_label:normalMap,input_6_label:F;proporder:1058;pass:END;sub:END;*/

Shader "Shader Forge/NormalTextureSF-Original" {
    Properties {
        _node_1058 ("node_1058", 2D) = "bump" {}
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            float3 Function_node_5072( float3 tDir , float3 bDir , float3 nDir , sampler2D normalMap , float2 uv ){
            float3 nDirTS = UnpackNormal(tex2D(normalMap, uv));
            float3x3 TBN = float3x3(tDir, bDir, nDir);
            float3 nDirWS = normalize(mul(nDirTS, TBN));
            return nDirWS;
            }
            
            uniform sampler2D _node_1058; uniform float4 _node_1058_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float node_7563 = max(dot(Function_node_5072( i.tangentDir , i.bitangentDir , i.normalDir , _node_1058 , i.uv0 ),lightDirection),0.0);
                float3 emissive = float3(node_7563,node_7563,node_7563);
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            float3 Function_node_5072( float3 tDir , float3 bDir , float3 nDir , sampler2D normalMap , float2 uv ){
            float3 nDirTS = UnpackNormal(tex2D(normalMap, uv));
            float3x3 TBN = float3x3(tDir, bDir, nDir);
            float3 nDirWS = normalize(mul(nDirTS, TBN));
            return nDirWS;
            }
            
            uniform sampler2D _node_1058; uniform float4 _node_1058_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
                i.normalDir = normalize(i.normalDir);
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
