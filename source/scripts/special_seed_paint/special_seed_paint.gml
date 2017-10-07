///@function special_seed_paint
///@arg seed
///@arg noise
///@arg surface

var seed = argument0;
var noise = argument1;
var surface = argument2;


switch( seed )
{
	case "MATANUI":
		draw_sprite_stretched( sMataNuiBump, 0, 0, 0, noise_width(noise), noise_height(noise) );
		return true; // Don't run the default code
	break;
	
	default:
		return false; // Nothing really happened
}