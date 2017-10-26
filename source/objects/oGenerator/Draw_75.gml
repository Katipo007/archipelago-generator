///@description 

// Flicker the cursor
if( cos(current_time/60) >= 0 )
	draw_sprite_ext( sCursor, 0, window_mouse_get_x(), window_mouse_get_y(), drawScale, drawScale, 0, c_white, 1.0 );