///@description Cleanup

noise_free(noise);

if( surface_exists(surface) )
	surface_free(surface);
	
ds_list_destroy(landmarks);

k3d_model_destroy( model );