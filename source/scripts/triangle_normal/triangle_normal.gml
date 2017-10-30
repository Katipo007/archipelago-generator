///@function triangle_normal
///@arg vec3_1
///@arg vec3_2
///@arg vec3_3

var normal = [0, 0, 0];
var vec1 = [0, 0, 0];
var vec2 = [0, 0, 0];

var tmpV1 = argument0;
var tmpV2 = argument1;
var tmpV3 = argument2;

normal = vector3_cross_product(
        vector3_minus( tmpV2, tmpV1 ),
        vector3_minus( tmpV3, tmpV1 ),
		);
normal = vector3_normalise( normal );

return normal;