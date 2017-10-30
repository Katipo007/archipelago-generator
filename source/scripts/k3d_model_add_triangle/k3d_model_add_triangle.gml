///@description k3d_model_add_triangle
///@arg vec5[x y z u v]
///@arg vec5[x y z u v]
///@arg vec5[x y z u v]
///@arg colour
///@arg normal[x y z]

var colour = argument[3];
var normal = argument[4];
var vbuff = global.k3d_current_vertex_buffer;

for( var i=0; i<3; i++ )
{
	var d = argument[i];
	
	vertex_position_3d( vbuff, d[0], d[1], d[2] );
	vertex_texcoord( vbuff, d[3], d[4] );
	vertex_normal( vbuff, normal[0], normal[1], normal[2] )
	vertex_color( vbuff, colour, 1.0);
}