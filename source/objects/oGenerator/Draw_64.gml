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
		
		var seaVal = seaLevel;//+0.1*sin(current_time/2000);
			
		var terrainCols = [
			0.32, 0.37, 0.70,
			0.55, 0.61, 1.00,
			1.00, 0.74, 0.65,
			0.54, 0.80, 0.36,
			0.51, 0.41, 0.33,
			0.70, 0.70, 0.70,
			0.90, 0.90, 0.90,
		];
		
		var terrainLevels = [
			seaVal*0.75,
			seaVal*0.95,
			seaVal*1.00,
			seaVal*1.47,
			seaVal*2.00, //seaVal*1.80,
			seaVal*2.20, //seaVal*1.80,
		];
		
		shader_set_uniform_i( shader_get_uniform(shader0, "levelCount"), array_length_1d(terrainCols)/3 );
		shader_set_uniform_f_array( shader_get_uniform(shader0, "levels"), terrainLevels );
		shader_set_uniform_f_array( shader_get_uniform(shader0, "levelColours"), terrainCols );
	
	
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
	
	
	draw_set_halign( fa_right );
	draw_text_transformed( window_get_width()-4, window_get_height()*0.4, name, scale, scale, 0 );
	draw_set_halign( fa_left );
	
	
	rotation += rotationSpeed;
}