// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33653,y:32812,varname:node_3138,prsc:2|emission-4489-OUT;n:type:ShaderForge.SFN_NormalVector,id:2410,x:31871,y:32913,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:7620,x:32072,y:32913,varname:node_7620,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-2410-OUT;n:type:ShaderForge.SFN_Multiply,id:2909,x:32264,y:33103,varname:node_2909,prsc:2|A-7620-OUT,B-3392-OUT;n:type:ShaderForge.SFN_Vector1,id:3392,x:32081,y:33177,varname:node_3392,prsc:2,v1:-1;n:type:ShaderForge.SFN_Clamp01,id:5462,x:32264,y:32913,cmnt:UpMask,varname:node_5462,prsc:2|IN-7620-OUT;n:type:ShaderForge.SFN_Clamp01,id:846,x:32462,y:33103,cmnt:BottomMask,varname:node_846,prsc:2|IN-2909-OUT;n:type:ShaderForge.SFN_Subtract,id:3281,x:32462,y:33263,varname:node_3281,prsc:2|A-1971-OUT,B-5462-OUT;n:type:ShaderForge.SFN_Vector1,id:1971,x:32264,y:33263,varname:node_1971,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:866,x:32652,y:33263,varname:node_866,prsc:2|A-3281-OUT,B-846-OUT;n:type:ShaderForge.SFN_Clamp01,id:720,x:32837,y:33263,cmnt:SideMask,varname:node_720,prsc:2|IN-866-OUT;n:type:ShaderForge.SFN_Color,id:7017,x:32264,y:32742,ptovrint:False,ptlb:UpColor,ptin:_UpColor,varname:node_7017,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.369571,c2:0.4787563,c3:0.5188679,c4:1;n:type:ShaderForge.SFN_Color,id:2217,x:32652,y:32975,ptovrint:False,ptlb:BottomColor,ptin:_BottomColor,varname:node_2217,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4433962,c2:0.4050511,c3:0.361828,c4:1;n:type:ShaderForge.SFN_Color,id:7041,x:32837,y:33432,ptovrint:False,ptlb:SideColor,ptin:_SideColor,varname:node_7041,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7830189,c2:0.7830189,c3:0.7830189,c4:1;n:type:ShaderForge.SFN_Multiply,id:2831,x:32462,y:32913,varname:node_2831,prsc:2|A-7017-RGB,B-5462-OUT;n:type:ShaderForge.SFN_Multiply,id:9574,x:32837,y:33082,varname:node_9574,prsc:2|A-2217-RGB,B-846-OUT;n:type:ShaderForge.SFN_Multiply,id:5606,x:33028,y:33263,varname:node_5606,prsc:2|A-720-OUT,B-7041-RGB;n:type:ShaderForge.SFN_Add,id:622,x:33022,y:32946,varname:node_622,prsc:2|A-2831-OUT,B-9574-OUT;n:type:ShaderForge.SFN_Add,id:1529,x:33220,y:33091,varname:node_1529,prsc:2|A-622-OUT,B-5606-OUT;n:type:ShaderForge.SFN_Tex2d,id:4872,x:33220,y:32858,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,varname:node_4872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1f36af5d1a8d1dd4f8d5171529cbd83e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4489,x:33420,y:32975,varname:node_4489,prsc:2|A-4872-RGB,B-1529-OUT;n:type:ShaderForge.SFN_Code,id:7289,x:32396,y:33512,varname:node_7289,prsc:2,code:,output:2,fname:Function_node_5072,width:676,height:277,input:2,input:2,input:2,input:1,input:2,input:1,input_1_label:tDIr,input_2_label:bDir,input_3_label:nDIr,input_4_label:uv,input_5_label:normalMap,input_6_label:F;proporder:7017-2217-7041-4872;pass:END;sub:END;*/

Shader "Shader Forge/3ColorAmbientSF" {
    Properties {
        _UpColor ("UpColor", Color) = (0.369571,0.4787563,0.5188679,1)
        _BottomColor ("BottomColor", Color) = (0.4433962,0.4050511,0.361828,1)
        _SideColor ("SideColor", Color) = (0.7830189,0.7830189,0.7830189,1)
        _Occlusion ("Occlusion", 2D) = "white" {}
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
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _UpColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BottomColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SideColor)
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
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion));
                float4 _UpColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _UpColor );
                float node_7620 = i.normalDir.g;
                float node_5462 = saturate(node_7620); // UpMask
                float4 _BottomColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BottomColor );
                float node_846 = saturate((node_7620*(-1.0))); // BottomMask
                float4 _SideColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SideColor );
                float3 emissive = (_Occlusion_var.rgb*(((_UpColor_var.rgb*node_5462)+(_BottomColor_var.rgb*node_846))+(saturate(((1.0-node_5462)-node_846))*_SideColor_var.rgb)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
