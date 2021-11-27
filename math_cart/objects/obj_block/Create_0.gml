event_inherited()

image_blend = c_red

block_value = 0

rail_id = noone
rail_color = c_white

pinged = false
awake = false

cell_x = x div CELL_SIZE
cell_y = y div CELL_SIZE

hspd = 0
vspd = 0
dir = 0

moving = false

init_self = function(_dir, _value)
{
	awake = true
	moving = true
	dir = _dir
	block_value = _value
	
	var list = instances_in_cell(cell_x + lengthdir_x(1, dir), cell_y + lengthdir_y(1, dir), obj_rail, true)
	rail_id = list[|0]
	rail_color = rail_id.image_blend
}

play_step = function()
{
	//move		
	x += hspd
	y += vspd
}

on_tick = function()
{
	//get rail ID
	var rail = rail_in_cell(cell_x, cell_y, rail_color)
		
	if rail != noone && !pinged//if rail exists and I'm not being forced to a location
	{
		//check if i need to change directions
		if is_turn(rail.orientation)
		{
			//if we're moving horizontally
			if dir == 0 || dir == 180
			{
				//turn up
				if rail.orientation == global.rail_orientations.corners.top_left || rail.orientation == global.rail_orientations.corners.top_right
				{
					dir = 90
				}
				//turn down
				else
				{
					dir = 270
				}
			}
			//if we're moving vertically
			else
			{
				//turn left
				if rail.orientation == global.rail_orientations.corners.top_left || rail.orientation == global.rail_orientations.corners.bottom_left
				{
					dir = 180
				}
				//turn right
				else
				{
					dir = 0
				}
			}
		}
		
		//check if I need to stop
		if is_node(rail.orientation)
		{
			if !rail_in_cell(cell_x + lengthdir_x(1, dir), cell_y + lengthdir_y(1, dir), rail_color)
			{
				//get the inverse direction 
				var invdir = dir
				repeat 2
				{
					invdir += 90
					invdir = loop(invdir, 0, 359)
				}
					
				//get the rail's direction
				var raildir = 0
				switch rail.orientation
				{
					case global.rail_orientations.nodes.up:
						raildir = 90
						break
					case global.rail_orientations.nodes.left:
						raildir = 180
						break
					case global.rail_orientations.nodes.right:
						raildir = 0
						break
					case global.rail_orientations.nodes.down:
						raildir = 270
						break
					case global.rail_orientations.nodes.isolated:
						raildir = 0
						moving = false
						break
					default:
						show_error("Found a non-node rail orientation when block " + string(id) + " when is_node for " + string(rail) + " returned true", true)
						break
				}
					
				//if something funky is going on
				if invdir != raildir
				{
					//force the block to go with the rail
					dir = raildir
				}
				//if nothing funky is going on, stop
				else
				{
					moving = false
				}
			}
		}
	}
		
	//calculate the position I need to be at by the next tick
	var next_cell_x = cell_x + lengthdir_x(moving, dir)
	var next_cell_y = cell_y + lengthdir_y(moving, dir)
		
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
	dir = point_direction(cell_x, cell_y, ping_cell_x, ping_cell_y)
	moving = true
}
