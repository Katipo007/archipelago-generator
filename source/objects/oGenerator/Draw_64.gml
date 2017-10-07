///@description Draw the island
self.drawScale = window_get_height()/size;
var scale = other.drawScale;

draw_text_transformed( 4, 4, "FPS: "+string(lastFPS), drawScale, drawScale, 0 );

shadersEnabled = !keyboard_check(vk_shift);

if( !instance_exists(oIsland) )
	exit;

if( !surface_exists( oIsland.surface ) ) {
	with( oIsland )
		event_user(0);
}
else with( oIsland ) {
	matrix_set( matrix_world, matrix_build( window_get_width()/2, window_get_height()/2, 20000, 65*(other.displayMode==1), 0, 0, 1, 1, 1 ) );
	
	if(other.displayMode==1)
		matrix_set( matrix_world, matrix_multiply(matrix_build( 0, 0, 0, 0, 0, rotation, 1, 1, 1), matrix_get(matrix_world)) )

	if(other.shadersEnabled)
		shader_set(shader0);
		
		var seaVal = seaLevel+0.1*sin(current_time/2000);
		
		if( seed == "MATANUI" )
			seaVal = 0.38;
			
		shader_set_uniform_f( shader_get_uniform(shader0, "seaLevel"), seaVal );
	
	
	draw_surface_ext( surface, other.drawScale*-size/2, other.drawScale*-size/2, other.drawScale, other.drawScale, 0, c_white, 1.0 );
	
	if(other.shadersEnabled)
		shader_reset();
	
	matrix_set( matrix_world, matrix_build_identity() );
	
	var seedString = oGenerator.seed;
	if( seedString == "" )
		seedString = seed;
	
	if( keyboard_check(vk_f3) )
	{
		seedString += "\n"+string(seedReal);
	}
	draw_text_transformed( 4, window_get_height()-string_height(seedString)*scale, seedString, scale, scale, 0 );
	
	rotation += rotationSpeed;
}