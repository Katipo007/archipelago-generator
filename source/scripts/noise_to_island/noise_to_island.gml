///noise_to_island
///@arg noise
///@arg surface

var noise = argument0;
var surf = argument1;

var noiseGrid = noise[ NOISE.GRID ];
var valMin = noise[ NOISE.MIN ];
var valMax = noise[ NOISE.MAX ];
var valAve = noise[ NOISE.AVERAGE];

var width = ds_grid_width(noiseGrid);
var height = ds_grid_height(noiseGrid);

var blackAndWhite = false;
var seaLevel = ((valAve - valMin) / (valMax - valMin))*1.5;

log( "Noise: "+string(noise) + "  -  SeaLevel: "+string(seaLevel) );


var val, col;
surface_set_target(surf);

for( var i=0; i<width; i++ ) {
	for( var j=0; j<height; j++ ) {
		
		val = (noiseGrid[# i, j] - valMin) / (valMax - valMin);
		
		if( blackAndWhite )
		{
			col = make_colour_hsv( 0, 0, 255 * val);
		}
		else
		{
			if( val <= seaLevel*0.75 )
				col = make_colour_rgbp(0.32, 0.37, 0.70); // Deep ocean
			else if( val <= seaLevel*0.95 )
				col = make_colour_rgbp(0.55, 0.61, 1.00); // Shallow ocean
			else if( val <= seaLevel )
				col = make_colour_rgbp(1.00, 0.74, 0.65); // Sand
			else
				col = make_colour_rgbp(0.54, 0.80, 0.36); // Green grass
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