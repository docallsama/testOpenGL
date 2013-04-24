attribute vec4 Position;
attribute vec4 SourceColor;
attribute vec3 Normal;

varying vec4 DestinationColor;

uniform mat4 Projection;
uniform mat4 Modelview;

attribute vec2 TexCoordIn;
varying vec2 TexCoordOut;

void main(void) {
    gl_Position = Projection * Modelview * Position;
    TexCoordOut = TexCoordIn;
    
    const float specularExp = 128.0;

    vec3 lightPos[3];
    lightPos[0] = vec3((0.0,0.0,-3.0));
    lightPos[1] = vec3((2.0,0.0,-3.0));
    lightPos[2] = vec3((-2.0,0.0,-3.0));
    
    vec3 lightCol[3];
    lightCol[0] = vec3(1.0,1.0,1.0);
    lightCol[1] = vec3(0.0,0.5,0.0);
    lightCol[2] = vec3(0.0,0.0,0.5);
    
    vec3 L[3];

    vec4 modelViewNormal = Modelview * vec4(Normal,1.0);
    vec3 N = normalize(modelViewNormal.xyz);
    vec4 V = Modelview * Position;
    for(int i = 0; i < 3; i++) {
        L[i] = normalize(lightPos[i] -V.xyz);
    }
    
    DestinationColor = vec4(0.0);
    
    for(int i = 0; i < 3; i++) {
        vec3 H = normalize(L[i] + vec3(0,0,1));
        float NdotL = max(0.0,dot(N,L[i]));
        DestinationColor.rgb += SourceColor.rgb * lightCol[i] * NdotL;


        float NdotH = max(0.0,dot(N,H));
        vec4 specular = vec4(0.0);
        if(NdotL > 0.0) {
            specular = vec4(pow(NdotH,specularExp));
            DestinationColor.rgb += lightCol[i] * pow(NdotH, specularExp);
        }
    }
    DestinationColor.a = SourceColor.a;
    vec4 ambient = vec4(1.0, 1.0, 1.0, 0.9);
    DestinationColor += ambient;
}
