///sample_diamond( grid, x, y, size, value)
///@function sample_diamond
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
 
//   c
//
//a  x  b
//
//   d
 
var a = sample(grid, xx - halfSize, yy);
var b = sample(grid, xx + halfSize, yy);
var c = sample(grid, xx, yy - halfSize);
var d = sample(grid, xx, yy + halfSize);
 
set_sample(grid, xx, yy, ((a + b + c + d) / 4.0)  + value);