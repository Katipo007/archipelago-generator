///@description Make new island

// Clean
	
if( ds_exists( noise, ds_type_grid ) )
	ds_grid_destroy(noise);

// Make new noise
//noise = make_noise( size, size/4, valMin, valMax );
noise = make_noise( size, size/2, valMin, valMax, seedGrid );

event_user(1);

if( surface_exists(surf) )
	surface_save( surf, "noise.png" );