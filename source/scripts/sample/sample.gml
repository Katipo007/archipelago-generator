///sample( grid, x, y )
///@function sample
///@arg grid
///@arg x
///@arg y

var grid = argument0;
var xx = argument1;
var yy = argument2;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

return grid[# (xx & (width - 1)), (yy & (height - 1))];