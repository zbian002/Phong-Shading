//HINTS: 
//  use gl_FrontMaterial's properties such as ambient, diffuse, specular
//  and shininess for material properties. (use gl_LightSource for light 
//  specular contribution)

varying vec3 lightDir, normal, pos;
void main()
{
    //use exaples above to set these vectors
    //Don't forget to normalize
    vec3 l, n, eye, r;
    l = normalize(lightDir);
    n = normalize(normal);
    eye = normalize(-pos);
    r = normalize(2.0 * dot(l, n) * n - l);

    vec4 color;
    // compute ambient component and add to color
    color = gl_LightSource[0].ambient * gl_FrontMaterial.ambient;
    // compute diffuse component and add to color
    float ln = dot(l, n);
    if(ln < 0.0)
	ln = 0.0;
    color += gl_LightSource[0].diffuse * gl_FrontMaterial.diffuse * ln;
    // compute specular component and add to color
    float rn = dot(eye, r);
    if(rn < 0.0)
	rn = 0.0;
    color += gl_LightSource[0].specular * gl_FrontMaterial.specular * pow(rn, gl_FrontMaterial.shininess); 
    gl_FragColor = color;    
}
