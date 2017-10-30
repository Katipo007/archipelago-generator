///@function k3d_model_create

ds_list_add( global.k3d_vertex_buffer_list, vertex_create_buffer() );
return ds_list_size( global.k3d_vertex_buffer_list ) - 1;