///@function random_name
var result = "";


return string_ucwords( string_speakable( irandom_range( 3, 9 ) ) );

var parts = [
"sha",
"lock",
"ne",
"ta",
"saa",
"ja",
"jo",
"yo",
"ya",
"nwa",
"yoc",
"yam",
"yee",
"re",
"ra",
"era",
"are",
"rae",
"io",
"yi"
];

var count = irandom_range(1, 4);
for( var i=0; i<count; i++; )
{
	if( (i != 0) && (i != count-1) && (count>1) )
	{
		if( chance(0.3) )
			result += " ";
		else if(chance(0.2))
			result += "-";
	}
		
	result += parts[ irandom(array_length_1d(parts)-1) ];
}

result = string_ucwords(result);


if( result == "" )
	return "<randomName>";
else
	return result;