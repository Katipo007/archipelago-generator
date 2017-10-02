///set_sample(x, y, value)
///@function set_sample
///@arg grid
///@arg x
///@arg y
///@arg value

var grid = argument0;
var xx = argument1;
var yy = argument2;
var value = argument3;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

xx = (xx & (width - 1));
yy = (yy & (height - 1));

if( is_undefined( grid[# xx, yy] ) ) 
	grid[# xx, yy] = value;