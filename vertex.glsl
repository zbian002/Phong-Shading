varying vec3 lightDir,normal,pos;
void main() {
  pos = (gl_ModelViewMatrix * gl_Vertex).xyz;
  normal = normalize(gl_NormalMatrix * gl_Normal);
  lightDir = normalize(gl_LightSource[0].position.xyz-pos); 
  gl_Position = gl_ProjectionMatrix 
      * gl_ModelViewMatrix
      * gl_Vertex;
  lightDir=normalize(gl_LightSource[0].position.xyz-pos);
}
