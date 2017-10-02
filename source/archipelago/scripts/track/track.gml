/// @description track( message );
/// @function track
/// @arg [message]

if( argument_count > 0 )
	show_debug_message( argument[0] + " took " + string(current_time - global.gt) + " ms" );
else
	show_debug_message( "Took " + string(current_time - global.gt) + " ms" );

global.gt = current_time;
