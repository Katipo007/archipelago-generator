//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform int levelCount;
uniform float levels[16];
uniform float levelColours[48];

void main()
{
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	bool set = false;
	
	int i = 0;
	
	for( i=0; i<levelCount; i++ )
	{
		if( col.r <= levels[i] )
		{
			int i1 = i*3;
			int i2 = i*3+1;
			int i3 = i*3+2;
			
			col.r = levelColours[i1];
			col.g = levelColours[i2];
			col.b = levelColours[i3];
			set = true;
			break;
		}
	}
	
	if( set == false )
	{
		int i1 = (levelCount-1)*3;
		int i2 = (levelCount-1)*3+1;
		int i3 = (levelCount-1)*3+2;
			
		col.r = levelColours[i1];
		col.g = levelColours[i2];
		col.b = levelColours[i3];
	}
	
    gl_FragColor = v_vColour * col;
}