///@function noise_to_surface
///@arg noise

var noise = argument0;

var noiseGrid = noise[ NOISE.GRID ];
var valMin = noise[ NOISE.MIN];
var valMax = noise[ NOISE.MAX ];

var width = ds_grid_width(noiseGrid);
var height = ds_grid_height(noiseGrid);



var surf = surface_create(width, height);

var val, col;
surface_set_target(surf);

for( var i=0; i<width; i++ ) {
	for( var j=0; j<height; j++ ) {
		val = (noiseGrid[# i, j] - valMin) / (valMax - valMin);
		
		col = make_colour_hsv( 0, 0, 255 * val);
		draw_point_colour( i, j, col );
	}
}
surface_reset_target();

return surf;