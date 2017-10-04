///noise_to_island
///@arg noise
///@arg surface

var noise = argument0;
var surf = argument1;

var width = ds_grid_width(noise);
var height = ds_grid_height(noise);

var blackAndWhite = false;
var seaLevel = 0.55;


var val, col;
surface_set_target(surf);

for( var i=0; i<width; i++ ) {
	for( var j=0; j<height; j++ ) {
		//val = make_colour_hsv( 0, 0, 255 * (clamp( grid[# i, j], valMin, valMax )/valMax) );
		val = (noise[# i, j] - valMin) / (valMax - valMin);
		
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


var mask = surface_create( surface_get_width(surf), surface_get_height(surf) );
surface_set_target( mask );
	draw_clear_alpha( c_black, 0.0 );
	draw_set_colour( c_white );
	draw_set_alpha( 1.0 );
	
	draw_circle( surface_get_width(surf)/2, surface_get_height(surf)/2, surface_get_width(surf)/2, false );
	
	draw_set_colour( c_white );
	draw_set_alpha( 1.0 );
	
surface_reset_target();


surface_set_target( surf );
	gpu_set_tex_filter( true );
	gpu_set_blendmode_ext( bm_inv_src_alpha, bm_subtract );
	gpu_set_colourwriteenable(0, 0, 0, 1);
	
	draw_surface( mask, 0, 0 );
	
	gpu_set_colourwriteenable(1, 1, 1, 1);
	gpu_set_blendmode(bm_normal);
	gpu_set_tex_filter( false );
surface_reset_target();

surface_free( mask );