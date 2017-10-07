///@function string_to_seed
///@arg str

var str = argument0;

//return real( string_digits( base64_encode( str ) ) );

var result = 0;

for( var i=0; i<SEED_LENGTH; i++ ) {
	if( i<=string_length(str) ) {
		result = (result*10) + real( ord(string_char_at(str, i+1)) );
	}
	else {
		// Nothing
	}
}
result = result % 2147483647;

log( "Seed: "+string(str)+" = "+string(result) );

return round( real( result ) );