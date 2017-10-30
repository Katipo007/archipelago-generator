///@function k3d_model_destroy
///@arg modelId

var model = argument0;
var vbuff = ds_list_find_value( global.k3d_vertex_buffer_list, model );

if( is_undefined( vbuff ) )
	return;

vertex_delete_buffer( ds_list_find_value( global.k3d_vertex_buffer_list, model ) );
ds_list_set( global.k3d_vertex_buffer_list, model, undefined ); // We can't remove the entry because it would change all the other ids