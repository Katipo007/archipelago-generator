///@description Key press events

if( keyboard_check_pressed( vk_enter ) )
{
	with( oIsland )
		instance_destroy();
	
	if( seed == "" )
		seed = new_random_seed();
		
	island_create( seed );
	seed = "";
}
else if( keyboard_check_pressed(vk_anykey) )
{
	if( keyboard_check_pressed(vk_backspace) )
	{
		seed = string_copy( seed, 1, string_length(seed)-1 );
	}
	else if( keyboard_lastchar != "" && (string_length(seed) < SEED_LENGTH))
	{
		seed = string_upper( string_lettersdigits(seed+keyboard_lastchar) );
	}
	keyboard_lastchar = "";
}
	
if( keyboard_check_pressed( vk_f2 ) )
{
	if( ++displayMode > 1 )
		displayMode = 0;
}

// Sea level manipulation
if( keyboard_check(vk_up) )
	oIsland.seaLevel = clamp(oIsland.seaLevel - 0.0025, valMin, valMax);
else if( keyboard_check(vk_down) )
	oIsland.seaLevel = clamp(oIsland.seaLevel + 0.0025, valMin, valMax);