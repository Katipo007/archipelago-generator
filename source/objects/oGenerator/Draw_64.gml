///@description Draw the island
draw_text( 4, 4, "FPS: "+string(lastFPS));

shadersEnabled = keyboard_check(ord("S"));

if( !surface_exists(surf) )
{
	event_user(1);
}
else
{
	matrix_set( matrix_world, matrix_build( window_get_width()/2, window_get_height()/2, 20000, 65*(displayMode==1), 0, 0, 1, 1, 1 ) );
	
	if(displayMode==1)
		matrix_set( matrix_world, matrix_multiply(matrix_build( 0, 0, 0, 0, 0, rotation, 1, 1, 1), matrix_get(matrix_world)) )

	if(shadersEnabled)
		shader_set(shader0);
	
	var drawScale = window_get_height()/size;
	draw_surface_ext( surf, drawScale*-size/2, drawScale*-size/2, drawScale, drawScale, 0, c_white, 1.0 );
	
	if(shadersEnabled)
		shader_reset();
	
	matrix_set( matrix_world, matrix_build_identity() );
}


rotation += rotationSpeed;