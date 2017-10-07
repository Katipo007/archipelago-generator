///@description 
randomise();
window_set_cursor( cr_none );
draw_set_font( font0 );

// FPS
lastFPS = fps;
alarm[0] = room_speed/2;

displayMode = 0;


seed = "";


shadersEnabled = true;

size = 256;
featureSize = size/4;
valMin = -128;//-1;
valMax = 127;//1;


seedGrid = ds_grid_create( size, size ); ds_grid_clear( seedGrid, undefined );

ds_grid_clear( seedGrid, valMin );
ds_grid_set_disk( seedGrid, size/2, size/2, size/2, undefined );

for( var i=0; i<size; i++ ) { seedGrid[# i, 0] = valMin; seedGrid[# i, size-1] = valMin; }
for( var j=0; j<size; j++ ) { seedGrid[# 0, j] = valMin; seedGrid[# size-1, j] = valMin; }

//seedGrid[# (size/2), (size/2)] = valMin;

repeat( 5 ) {
	//seedGrid[# irandom(size), irandom(size)] = valMin;
}

island_create();