///@description 
randomise();

size = 128;
valMin = -1;
valMax = 1;

seedGrid = ds_grid_create( size, size ); ds_grid_clear( seedGrid, undefined );
for( var i=0; i<size; i++ ) {
	for( var j=0; j<size; j++ ) {
		if( i==0 || j==0 || i==(size-1) || j==(size-1) )
			seedGrid[# i, j] = valMin*2;
	}
}

noise = -1;
surf = -1;
event_user(0);