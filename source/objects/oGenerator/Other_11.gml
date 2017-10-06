///@description Update surface

if( surface_exists(surf) )
	surface_free( surf );


surf = noise_to_surface( noise );

noise_to_island( noise, surf );

seaLevel = ((noise[NOISE.AVERAGE] - noise[NOISE.MIN]) / (noise[NOISE.MAX] - noise[NOISE.MIN]))*1.5;