///@function make_noise
///@arg size
///@arg featureSize
///@arg minVal
///@arg maxVal
///@arg [seedGrid] - undefined for values to keep empty

var size = argument[0];
var featureSize = argument[1];
var valMin = argument[2];
var valMax = argument[3];
var seedGrid = ((argument_count >= 5) ? argument[4] : -1);


var grid = ds_grid_create( size, size ); ds_grid_clear( grid, undefined );
var width = size;
var height = size;

track_begin(); // Track the time things take


// Fill with values from the seedGrid
if( ds_exists( seedGrid, ds_type_grid ) ) {
	ds_grid_copy( grid, seedGrid );
}


// Seed the grid with random values for features
for( var j = 0; j < height; j += featureSize) {
	for (var i = 0; i < width; i += featureSize) {
		set_sample(grid, i, j, random_range(valMin, valMax));
	}
}

track( "Initial seeding" );

var sampleSize = featureSize;
var scale = 1;

// Fill in the noise
while( sampleSize > 1 ) {
    diamond_square(grid, sampleSize, scale, valMin, valMax);
     
    sampleSize /= 2;
    scale /= 2;
}
track( "Filling" );


// Due to how the algorithm works some values may be above/below the given max, so we need to figure out how much to scale by

var maxValue = valMax;
var minValue = valMin;
var valTotal = 0;

for(var i = 0; i < width; i++) {
    for(var j = 0; j < height; j++) {
		if( grid[# i, j] < minValue ) {minValue = grid[# i, j];}
		else if( grid[# i, j] > maxValue ) {maxValue = grid[# i, j];}
		
		valTotal += grid[# i, j];
    }
}

var maxScalar = abs(valMax/maxValue);
var minScalar = abs(valMin/minValue);
var scaler = min(maxScalar, minScalar);

var sum = 0;

// Cycle through again and multiply all values
for(var i = 0; i < width; i++) {
	for(var j = 0; j < height; j++) {
		grid[# i, j] *= scaler
		
		sum += grid[# i, j];
	}
}

var average = sum / (width*height);
track( "Correcting" );
// All noise should now fit between the given values (valMin and valMax)


return [grid, valMin, valMax, average];