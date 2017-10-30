///@description 
randomise(); // Pick a random internal seed on run

k3d_prepare();
window_set_cursor( cr_none ); // Make the cursor invisible
draw_set_font( font0 );

// FPS counter
lastFPS = fps;
alarm[0] = room_speed/2;

displayMode = 0;


seed = "";
shadersEnabled = true;

size = 256;
featureSize = size/4;
valMin = -128;
valMax = 127;

// Prepare the seed grid
seedGrid = ds_grid_create( size, size ); ds_grid_clear( seedGrid, undefined );

ds_grid_clear( seedGrid, valMin );
ds_grid_set_disk( seedGrid, size/2, size/2, size/2, undefined ); // The noise generator can only replace undefined values

// Set the edges of the seed grid to minimum value so the island doesn't go over the edge
//for( var i=0; i<size; i++ ) { seedGrid[# i, 0] = valMin; seedGrid[# i, size-1] = valMin; }
//for( var j=0; j<size; j++ ) { seedGrid[# 0, j] = valMin; seedGrid[# size-1, j] = valMin; }


island_create();