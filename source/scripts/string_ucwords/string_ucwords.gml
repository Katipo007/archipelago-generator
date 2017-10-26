///@function string_ucwords
///@arg str

///@note: Based on 'string_ucwords' from gmlscripts.com
///@source: http://www.gmlscripts.com/script/string_ucwords

var str = argument0;
var out = "";
var w = true;
var i = 1;
var c;
var o;

repeat( string_length(str) )
{
    c = string_char_at(str,i);
    o = ord(c);
	
    if( (o > 8) && (o < 14) || (o == 32) )
	{
        w = true;
    }
	else
	{
        if( w == true )
			c = string_upper(c);
			
        w = false;
    }
	
    out += c;
    i += 1;
}

return out;