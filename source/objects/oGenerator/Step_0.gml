///@description 

if( keyboard_check_pressed( vk_space ) )
	event_user(0);
	
if( keyboard_check_pressed(ord("1")) )
	displayMode = 0;
if( keyboard_check_pressed(ord("2")) )
	displayMode = 1;