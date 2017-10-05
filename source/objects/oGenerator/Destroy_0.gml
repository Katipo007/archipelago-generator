///@description 

if( ds_exists( seedGrid, ds_type_grid ) )
	ds_grid_destroy(seedGrid);

noise_free( noise );

if( surface_exists(surf) )
	surface_free( surf );