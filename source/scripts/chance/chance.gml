///chance(<chance>,<out of>)
/*
Information:
    A replacement for the 'chance' DnD block
Usage:
    chance(<chance>,<out of>)
Returns:
    True or False
Event:
    Any
Created by: Ben Edwards
*/
if argument0==argument1 then return(true)
repeat(argument0)
{
    if irandom_range(0,argument1) == 0 then return(true)
}

return(false)

