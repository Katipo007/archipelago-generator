///@function new_random_seed

var result = "";
var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

repeat( SEED_LENGTH ) {
	result += string_char_at( str, 1+irandom((string_length(str))-1) );
}

return result;