/// @description k3d_draw_model
/// @arg modelId
/// @arg x
/// @arg y
/// @arg z
/// @arg texture


var matrix = matrix_build( argument1, argument2, argument3, 0, 0, 0, 1, 1, 1 );
var preMatrix = matrix_get( matrix_world );
matrix = matrix_multiply( matrix, preMatrix );
matrix_set( matrix_world, matrix );

vertex_submit( ds_list_find_value(global.k3d_vertex_buffer_list, argument0 ), pr_trianglelist, argument4 );

matrix_set( matrix_world, preMatrix );