/// @description k3d_draw_model_ext
/// @arg modelId
/// @arg x
/// @arg y
/// @arg z
/// @arg xRotation
/// @arg yRotation
/// @arg zRotation
/// @arg xScale
/// @arg yScale
/// @arg zScale
/// @arg texture


var matrix = matrix_build( argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9);
matrix_set(matrix_world, matrix);

vertex_submit( ds_list_find_value(global.k3d_vertex_buffer_list, argument0), pr_trianglelist, argument10);

matrix_set( matrix_world, matrix_build_identity() );