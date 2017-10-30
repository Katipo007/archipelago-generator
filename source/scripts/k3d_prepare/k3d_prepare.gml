///@function ked_prepare

///@description Prepares things required for the other k3d_* functions


/// Prepare the model format
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_normal();
vertex_format_add_colour();
global.k3d_vertex_format = vertex_format_end();


/// Prepare the model storage
global.k3d_vertex_buffer_list = ds_list_create();


global.k3d_current_vertex_buffer = undefined; // Current vertex buffer we are modifying