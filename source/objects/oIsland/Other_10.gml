///@description Refresh surface

if( surface_exists(surface) )
	surface_free(surface);
	
surface = noise_to_surface( noise );
noise_to_island( noise, surface );