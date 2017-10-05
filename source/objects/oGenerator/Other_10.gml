///@description Make new island

// Clean
noise_free( noise );

// Make new noise
noise = make_noise( size, featureSize, valMin, valMax, seedGrid );

if( surface_exists(surf) )
	surface_save( surf, "noise.png" );

event_user(1);