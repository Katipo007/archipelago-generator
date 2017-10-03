///@function noise_to_surface
///@arg noiseGrid
///@arg valMin
///@arg valMax

var grid = argument0;
var valMin = argument1;
var valMax = argument2;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

var blackAndWhite = false;
var seaLevel = 0.4;


var surf = surface_create(width, height);
var val, col;
surface_set_target(surf);

for( var i=0; i<width; i++ ) {
	for( var j=0; j<height; j++ ) {
		//val = make_colour_hsv( 0, 0, 255 * (clamp( grid[# i, j], valMin, valMax )/valMax) );
		val = (grid[# i, j] - valMin) / (valMax - valMin);
		
		if( blackAndWhite )
		{
			col = make_colour_hsv( 0, 0, 255 * val);
		}
		else
		{
			if( val <= seaLevel*0.7 )
				col = make_colour_rgbp(0.32, 0.37, 0.70);//vec3(0.02, 0.52, 0.82); // Deep ocean
			else if( val <= seaLevel*0.9 )
				col = make_colour_rgbp(0.55, 0.61, 1.00);//vec3(0.17, 0.91, 0.96); // Shallow ocean
			else if( val <= seaLevel )
				col = make_colour_rgbp(1.00, 0.74, 0.65);//vec3(0.89, 0.65, 0.45); // Sand
			else
				col = make_colour_rgbp(0.54, 0.80, 0.36);//vec3(0.39, 0.78, 0.30); // Green grass
		}
		
		draw_point_colour( i, j, col );
	}
}


surface_reset_target();
return surf;