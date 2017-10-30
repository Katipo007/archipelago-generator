///@function vector3_cross_product
///@arg vec3_1
///@arg vec3_2

var v1 = argument0;
var v2 = argument1;
var out = [0, 0, 0];

out[0] = v1[1] * v2[2] - v1[2] * v2[1];
out[1] = v1[2] * v2[0] - v1[0] * v2[2];
out[2] = v1[0] * v2[1] - v1[1] * v2[0];

return out;