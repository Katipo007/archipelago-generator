///@description Draw the island

// Scale the island to the window size
self.drawScale = window_get_height()/size;
var scale = other.drawScale;

// Draw the FPS counter if the debug key is held
if( keyboard_check( KEY_DEBUG ) )
	draw_text_transformed( 4, 4, "FPS: "+string(lastFPS), drawScale, drawScale, 0 );

// Disable the shader if SHIFT is held
shadersEnabled = !keyboard_check(vk_shift);

// If no island exists exit out
if( !instance_exists(oIsland) )
	exit;

// If the surface doesn't exist recreate it
if( !surface_exists( oIsland.surface ) )
{
	with( oIsland )
		event_user(0);
}
else
{
	var displayMode = self.displayMode;
	var shadersEnabled = self.shadersEnabled;
	
	with( oIsland )
	{
		// Translation matrix
		matrix_set( matrix_world, matrix_build( window_get_width()/2, window_get_height()/2, 20000, 65*(displayMode==1), 0, 0, 1, 1, 1 ) );
	
		// Spin the island if in displayMode 1
		if(displayMode==1)
			matrix_set( matrix_world, matrix_multiply(matrix_build( 0, 0, 0, 0, 0, rotation, 1, 1, 1), matrix_get(matrix_world)) )

		#region SHADER SETUP
			// Set the current shader
			if(shadersEnabled)
			{
				shader_set(shColourIsland);
		
				var seaVal = seaLevel;//+0.1*sin(current_time/2000);
			
				// Colour values to feed to the shader (r%, g%, b%)
				var terrainCols = [
					0.32, 0.37, 0.70,
					0.55, 0.61, 1.00,
					1.00, 0.74, 0.65,
					0.54, 0.80, 0.36,
					0.51, 0.41, 0.33,
					0.70, 0.70, 0.70,
					0.90, 0.90, 0.90,
				];
		
				// Tide value for ocean tides
				var tide = sin(current_time/700);
		
				// Values to use for respective colours in the shader
				var terrainLevels = [
					seaVal*0.75 + 0.006*tide,
					seaVal*0.95 + 0.01*tide,
					seaVal*1.00,
					seaVal*1.47,
					seaVal*2.00, //seaVal*1.80,
					seaVal*2.20, //seaVal*1.80,
				];
		
				// Feed values to shader
				shader_set_uniform_i( shader_get_uniform(shColourIsland, "levelCount"), array_length_1d(terrainCols)/3 );
				shader_set_uniform_f_array( shader_get_uniform(shColourIsland, "levels"), terrainLevels );
				shader_set_uniform_f_array( shader_get_uniform(shColourIsland, "levelColours"), terrainCols );
			}
		#endregion
	
		// Draw the surface containing the island
		draw_surface_ext( surface, other.drawScale*-size/2, other.drawScale*-size/2, other.drawScale, other.drawScale, 0, c_white, 1.0 );
	
		// Reset the shader
		if(shadersEnabled)
			shader_reset();
	
		// Reset the matrix
		matrix_set( matrix_world, matrix_build_identity() );
	
	
		#region DRAW SEED TO SCREEN
			// Get the current seed ready to draw to the screen
			var seedString = oGenerator.seed;
			if( seedString == "" )
				seedString = seed;
	
	
			// Also draw the internal seed value to the screen if the debug key is held
			if( keyboard_check( KEY_DEBUG ) )
			{
				seedString += "\n"+string(seedReal);
			}
			// Draw the seed text to the screen
			draw_text_transformed( 4, window_get_height()-string_height(seedString)*scale, seedString, scale, scale, 0 );
		#endregion
	
		// Draw the Island's name to the screen
		draw_set_halign( fa_right );
		draw_text_transformed( window_get_width()-4, window_get_height()*0.4, name, scale, scale, 0 );
		draw_set_halign( fa_left );
	
		
		// Increase the rotation
		rotation += rotationSpeed;
	}
}