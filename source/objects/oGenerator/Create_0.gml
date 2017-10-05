///@description 
randomise();

lastFPS = fps;
alarm[0] = room_speed/2;

rotation = 0;
rotationSpeed = 360/(room_speed*60);

displayMode = 0;

size = 256;
featureSize = size/4;
valMin = -128;//-1;
valMax = 127;//1;

shadersEnabled = false;


seedGrid = ds_grid_create( size, size ); ds_grid_clear( seedGrid, undefined );

ds_grid_clear( seedGrid, valMin );
ds_grid_set_disk( seedGrid, size/2, size/2, size/2, undefined );

for( var i=0; i<size; i++ ) { seedGrid[# i, 0] = valMin; seedGrid[# i, size-1] = valMin; }
for( var j=0; j<size; j++ ) { seedGrid[# 0, j] = valMin; seedGrid[# size-1, j] = valMin; }

//seedGrid[# (size/2), (size/2)] = valMin;//random_range(valMin, valMax);

repeat( 5 ) {
	//seedGrid[# irandom(size), irandom(size)] = valMin;
}

noise = -1;
surf = -1;
event_user(0);