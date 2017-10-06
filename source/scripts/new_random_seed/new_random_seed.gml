///@function new_random_seed

var result = "";
var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

repeat( SEED_LENGTH ) {
	result += string_char_at( str, irandom(1+(string_length(str))) );
}

return result;