///@description Make new island

// Clean
	
if( ds_exists( noise, ds_type_grid ) )
	ds_grid_destroy(noise);

// Make new noise
//noise = make_noise( size, featureSize, valMin, valMax );
noise = make_noise( size, featureSize, valMin, valMax, seedGrid );

if( surface_exists(surf) )
	surface_save( surf, "noise.png" );

event_user(1);