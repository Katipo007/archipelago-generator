///@description Key press events

if( keyboard_check_pressed( vk_space ) ) {
	with( oIsland ) {instance_destroy()};
	
	island_create();
}
	
if( keyboard_check_pressed(ord("1")) )
	displayMode = 0;
if( keyboard_check_pressed(ord("2")) )
	displayMode = 1;