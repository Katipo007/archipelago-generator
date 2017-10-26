///@description Key press events

#region Manual seed entry
	if( keyboard_check_pressed( vk_enter ) )
	{
		// If the enter key is pressed it means we want to generate a new island
		
		with( oIsland ) // Destroy the existing island
			instance_destroy();
	
		if( seed == "" ) // If nothing was entered as the seed pick a random one
			seed = new_random_seed();
		
		// Make the new island
		island_create( seed );
		seed = "";
	}
	else if( keyboard_check_pressed(vk_anykey) )
	{
		if( keyboard_check_pressed(vk_backspace) )
			seed = string_copy( seed, 1, string_length(seed)-1 );
		
		else if( keyboard_lastchar != "" && (string_length(seed) < SEED_LENGTH))
			seed = string_upper( string_lettersdigits(seed+keyboard_lastchar) );
		
		
		keyboard_lastchar = "";
	}
#endregion


// Pressing F2 changes the display mode for the island
if( keyboard_check_pressed( KEY_CHANGE_DISPLAY_MODE ) )
{
	if( ++displayMode > 1 )
		displayMode = 0;
}


// Sea level manipulation
if( keyboard_check(vk_up) )
	oIsland.seaLevel = clamp(oIsland.seaLevel - 0.0025, valMin, valMax);
else if( keyboard_check(vk_down) )
	oIsland.seaLevel = clamp(oIsland.seaLevel + 0.0025, valMin, valMax);