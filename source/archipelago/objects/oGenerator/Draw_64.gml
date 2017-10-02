///@description 

if( surface_exists(surf) )
{
	shader_set(shader0);
	var drawScale = window_get_height()/size;
	draw_surface_ext( surf, 0, 0, drawScale, drawScale, 0, c_white, 1.0 );
	shader_reset();
}