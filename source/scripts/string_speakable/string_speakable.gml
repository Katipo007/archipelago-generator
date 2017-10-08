///@function string_speakable
///@arg length

var result, i, offset;
offset = choose( 0, 1 );
result = "";

for( i=offset; i<(argument0+offset); i++ )
{
    if (i mod 2)
		result += string_char_at( "aeiou", ceil( random(5) ) );
    else
		result += string_char_at( "bcdfghjklmnprstwyz", ceil( random(18) ) );
}

return result;