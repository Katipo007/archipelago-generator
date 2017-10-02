///@description Update surface

if( surface_exists(surf) )
	surface_free( surf );


surf = noise_to_surface( noise, valMin, valMax );

noise_to_island( noise, surf );