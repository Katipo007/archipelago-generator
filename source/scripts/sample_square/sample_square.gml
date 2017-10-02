///sample_square( grid, x, y, size, value)
///@function sample_square
///@arg grid
///@arg x
///@arg y
///@arg size
///@arg value

var grid = argument0;
var xx = argument1;
var yy = argument2;
var size = argument3;
var value = argument4;

var halfSize = size / 2;
 
// a     b 
//
//    x
//
// c     d
 
var a = sample(grid, xx - halfSize, yy - halfSize);
var b = sample(grid, xx + halfSize, yy - halfSize);
var c = sample(grid, xx - halfSize, yy + halfSize);
var d = sample(grid, xx + halfSize, yy + halfSize);
 
set_sample(grid, xx, yy, ((a + b + c + d) / 4.0)  + value);