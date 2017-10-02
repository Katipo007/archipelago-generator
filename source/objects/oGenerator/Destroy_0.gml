///@description 

if( ds_exists( seedGrid, ds_type_grid ) )
	ds_grid_destroy(seedGrid);

if( ds_exists( noise, ds_type_grid ) )
	ds_grid_destroy(noise);

if( surface_exists(surf) )
	surface_free( surf );