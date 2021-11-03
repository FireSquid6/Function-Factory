event_inherited()

image_blend = c_red

value = 0

rail_id = noone
rail_color = c_white

//move 
offset_x = (CELL_SIZE - sprite_width) / 2
offset_y = (CELL_SIZE - sprite_height) /2

x += offset_x
y += offset_y

cell_x = x div CELL_SIZE
cell_y = y div CELL_SIZE

hspd = 0
vspd = 0
dir = 0

//get whatever dispensed me
dispenser_id = collision_point(x, y, obj_dispenser, false, true)
if dispenser_id == noone //something has gone wrong
{
	show_error("the programmer is a moron. (block couldn't find dispenser at" + string(x) + ", " + string(y) + ")", true)
}

//check if there's a rail in front of me
//note for future me when he comes back:
	//currently working on getting the block to detect which dispenser dispensed it and which direction it should check for a rail
	//rail id needs to be something for the block to exist
var dispenser_dir = dispenser_id.dir
var list = instances_in_cell(cell_x + lengthdir_x(1, dispenser_dir), cell_y + lengthdir_y(1, dispenser_dir), obj_rail, true)
rail_id = list[|0]

//if there is a rail in front of me, get real
if rail_id != noone
{
	rail_color = rail_id.image_blend
	
	play_step = function()
	{
		//move		
		x += hspd
		y += vspd
	}

	on_tick = function()
	{
		//get rail ID
		var list = instances_in_cell(cell_x, cell_y, obj_rail)
		
		//check if i need to change directions
		
		//check if I need to stop
		
		//calculate the position I need to be at by the next tick
		var next_cell_x = cell_x + lengthdir_x(1, dir)
		var next_cell_y = cell_y + lengthdir_y(1, dir)
		
		var next_x = (next_cell_x * CELL_SIZE) + offset_x
		var next_y = (next_cell_y * CELL_SIZE) + offset_y
		
		var xdist = next_x - x
		var ydist = next_y - y
		
		//calculate the speed I need to move at to get there
		hspd = xdist / global.tick_speed 
		vspd = ydist / global.tick_speed 
	}
}
//if there's no rail, die
else
{
	instance_destroy()
}