//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	if( col.r < 0.35 )
	{
		col.rgb = vec3( .33, .54, .78 );
	}
	else
	{
		col.r = 0.0;
		col.g = 1.0;
		//col.b = 0.0;
	}
	
	
    gl_FragColor = v_vColour * col;
}
