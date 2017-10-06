//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float seaLevel;

void main()
{
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	
	if( col.r <= seaLevel*0.75 )
		col.rgb = vec3(0.32, 0.37, 0.70);//vec3(0.02, 0.52, 0.82); // Deep ocean
	else if( col.r <= seaLevel*0.95 )
		col.rgb = vec3(0.55, 0.61, 1.00);//vec3(0.17, 0.91, 0.96); // Shallow ocean
	else if( col.r <= seaLevel )
		col.rgb = vec3(1.00, 0.74, 0.65);//vec3(0.89, 0.65, 0.45); // Sand
	else
		col.rgb = vec3(0.54, 0.80, 0.36);//vec3(0.39, 0.78, 0.30); // Green grass
	
	
    gl_FragColor = v_vColour * col;
}
