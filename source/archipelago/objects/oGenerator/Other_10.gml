///@description 

// Clean
if( surface_exists(surf) )
	surface_free( surf );
	
if( ds_exists( noise, ds_type_grid ) )
	ds_grid_destroy(noise);

// Make new noise
//noise = make_noise( size, size/4, valMin, valMax );
noise = make_noise( size, size/2, valMin, valMax, seedGrid );

surf = noise_to_surface( noise, valMin, valMax );

if( surface_exists(surf) )
	surface_save( surf, "noise.png" );