///noise_to_island
///@arg noise
///@arg surface

var noise = argument0;
var surf = argument1;

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