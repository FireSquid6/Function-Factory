event_inherited()

image_blend = c_red

block_value = 0

rail_color = c_white

pinged = false
awake = false

cell_x = x div CELL_SIZE
cell_y = y div CELL_SIZE

next_cell_x = -1
next_cell_y = -1

ping_x = -1
ping_y = -1

hspd = 0
vspd = 0
dir = 0

outputer_id = noone
outputer_index = -1

moving = false

init_self = function(_dir, _value, _id, _index)
{
	awake = true
	moving = true
	dir = _dir
	block_value = _value
	outputer_id = _id
	outputer_index = _index
	
	//get rail color
	var list = instances_in_cell(cell_x + lengthdir_x(1, dir), cell_y + lengthdir_y(1, dir), obj_rail, true)
	rail_color = list[|0].image_blend
	
	//pint self
	ping_self(cell_x + lengthdir_x(1, dir), cell_y + lengthdir_y(1, dir))
}

play_step = function()
{
	//move		
	x += hspd
	y += vspd
}

on_tick_start = function()
{
	//make sure I'm at the correct position
	if next_cell_x != -1
	{
		x = next_cell_x * CELL_SIZE
		y = next_cell_y * CELL_SIZE
	}
	
	//update cell position
	cell_x = x div CELL_SIZE
	cell_y = y div CELL_SIZE
	
	//get rail ID
	var rail = rail_in_cell(cell_x, cell_y, rail_color)	
	
	//if I'm at the pinged location, go back to normal
	if cell_x == ping_x && cell_y == ping_y {pinged = false}
	
	if pinged //if I'm being forced to a certain direction, go there
	{
		dir = point_direction(cell_x, cell_y, ping_x, ping_y)
		moving = true
	}
	else if rail != noone //make sure there is a rail
	{
		if is_node(rail.orientation) //if I'm not at a node, stop and wait to be pinged
		{
			//make sure I'm not just in my outputer's output position
			var output_position = outputer_id.output_positions[outputer_index]
			if output_position.x != cell_x or output_position.y != cell_y
			{
				moving = false
			}
		}
		else if is_turn(rail.orientation) //if I'm at a turn, change my direction
		{
			//if I'm going up or down
			if dir = 90 || dir = 270
			{
				if rail.orientation == global.rail_orientations.corners.top_left || rail.orientation == global.rail_orientations.corners.bottom_left
				{
					dir = 180
				}
				else
				{
					dir = 0
				}
			}
			//if I'm going left or right
			else
			{
				if rail.orientation == global.rail_orientations.corners.top_left || rail.orientation == global.rail_orientations.corners.top_right //if I should turn right
				{
					dir = 90
				}
				else
				{
					dir = 270
				}
			}
		}
	}
	
	calculate_movement()
}

calculate_movement = function()
{
	//calculate the position I need to be at by the next tick
	next_cell_x = cell_x + lengthdir_x(moving, dir)
	next_cell_y = cell_y + lengthdir_y(moving, dir)
		
	var next_x = (next_cell_x * CELL_SIZE)
	var next_y = (next_cell_y * CELL_SIZE)
		
	var xdist = next_x - x
	var ydist = next_y - y
		
	//calculate the speed I need to move at to get there
	hspd = xdist / global.tick_speed 
	vspd = ydist / global.tick_speed 
}
	
event_stop = function()
{
	instance_destroy()
}

//when called tells this rail to start moving to the pinged location
//only works if rail isn't moving
ping_self = function(ping_cell_x, ping_cell_y)
{
	pinged = true //note to self: implement a system later that turns this to false when it gets to the pinged cell
				  //if something in the future isn't working this is why
				  //I'm sorry future self
				  
				  //hey it's me future Jonathan turns out this reason it wasn't working is because of this]
				  //screw you past me I hope you kill yourself
	ping_x = ping_cell_x
	ping_y = ping_cell_y
	dir = point_direction(cell_x, cell_y, ping_x, ping_y)
	moving = true
	
	calculate_movement()
}
