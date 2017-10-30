///@function vector3_normalise
///@arg vec3

var v = argument0;

var magnitudeSqrd = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
if (magnitudeSqrd == 0)
	return v;

var magnitude = sqrt( magnitudeSqrd );

return vector3( v[0] / magnitude, v[1] / magnitude, v[2] / magnitude );