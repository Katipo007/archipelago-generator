///@function string_to_seed
///@arg str

var str = argument0;

var result = 0;

for( var i=0; i<SEED_LENGTH; i++ ) {
	if( i<string_length(str) ) {
		result = ord(string_char_at(str, i+1)) + result;
	}
	else {
		// Nothing
	}
}

return round( real( result ) );