///@function noise_to_surface
///@arg noiseGrid
///@arg valMin
///@arg valMax

var grid = argument0;
var valMin = argument1;
var valMax = argument2;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);


var surf = surface_create(width, height);

var val, col;
surface_set_target(surf);

for( var i=0; i<width; i++ ) {
	for( var j=0; j<height; j++ ) {
		val = (grid[# i, j] - valMin) / (valMax - valMin);
		
		col = make_colour_hsv( 0, 0, 255 * val);
		draw_point_colour( i, j, col );
	}
}
surface_reset_target();

return surf;