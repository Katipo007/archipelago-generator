///@function noise_to_3d_model
///@arg noise


var noise = argument0;

var noiseGrid = noise[ NOISE.GRID ];
var valMin = noise[ NOISE.MIN];
var valMax = noise[ NOISE.MAX ];

var width = ds_grid_width(noiseGrid);
var height = ds_grid_height(noiseGrid);

var model = k3d_model_create();

k3d_model_begin(model);
var x1, x2, y1, y2, v1, v2, v3, v4;

for( var i=0; i<(width-1); i++ )
{
	for( var j=0; j<(height-1); j++ )
	{
		x1 = i; x2 = i+1;
		y1 = j; y2 = j+1;
		
		v1 = vector3(x1, y1, noiseGrid[# x1, y1]);
		v2 = vector3(x2, y1, noiseGrid[# x2, y1]);
		v3 = vector3(x1, y2, noiseGrid[# x1, y2]);
		v4 = vector3(x2, y2, noiseGrid[# x2, y2]);
		/*
			v1	 v2
			
			v3	 v4
		*/
		
		var n1 = triangle_normal( v3, v1, v2 );
		var n2 = triangle_normal( v2, v4, v3 );
		k3d_model_add_triangle(
				vector5(v3, x1/width, y2/height),
				vector5(v1, x1/width, y1/height),
				vector5(v2, x2/width, y1/height),
				c_white,
				n1
			);
		
		k3d_model_add_triangle(
				vector5(v2, x2/width, y1/height),
				vector5(v4, x2/width, y2/height),
				vector5(v3, x1/width, y2/height),
				c_white,
				n2
			);
	}
}
k3d_model_end();

return model;