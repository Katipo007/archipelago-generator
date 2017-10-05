///@function noise_free
///@arg noise

var noise = argument0;

if( is_array(noise) == false )
	return;

if( ds_exists( noise[NOISE.GRID], ds_type_grid ) )
	ds_grid_destroy( noise[NOISE.GRID] );