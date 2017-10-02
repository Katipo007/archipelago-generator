///diamond_square( grid, stepsize, scale )
///@function diamond_square
///@arg grid
///@arg stepSize
///@arg scale
///@arg minValue
///@arg maxValue

var grid = argument0;
var stepSize = argument1;
var scale = argument2;
var valMin = argument3;
var valMax = argument4;
var originalScale = scale;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);
var halfstep = stepSize / 2;


for( var k=halfstep; k<(height + halfstep); k += stepSize) {
	for (var l=halfstep; l<(width + halfstep); l += stepSize) {
		sample_square(grid, l, k, stepSize, random_range(valMin, valMax) * originalScale);
	}
}

for (var k = 0; k < height; k += stepSize) {
	for (var l = 0; l < width; l += stepSize) {
		sample_diamond(grid, l + halfstep, k, stepSize, random_range(valMin, valMax) * originalScale);
		sample_diamond(grid, l, k + halfstep, stepSize, random_range(valMin, valMax) * originalScale);
		
		//scale *= power(2, -originalScale);
	}
}