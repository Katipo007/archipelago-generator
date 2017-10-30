///@function k3d_model_begin
///@arg modelId

var model = argument0;

global.k3d_current_vertex_buffer = ds_list_find_value( global.k3d_vertex_buffer_list, model );
vertex_begin( global.k3d_current_vertex_buffer, global.k3d_vertex_format );