event_inherited()
//OVERRIDE PARENT STUFF
event_start = function()
{
	
}

//set vars
image_blend = c_yellow
completed = false //whether the ejector has the correct value or not
pinged = false //whether the ejector has pinged a block to move into it

//methods
on_place = function()
{
	global.ejectors_required += 1
}

on_destroy = function()
{
	global.ejectors_required -= 1
}

on_tick = function()
{
	if !pinged //if no block has been told to move into me
	{
		//check if there's a block in the cell i'm facing
		var list = instances_in_cell(cell_x + lengthdir_x(1, dir), cell_y + lengthdir_x(1, dir), obj_block, true)
	
		if list != 0
		{
			//check if it has the correct number
			if list[|0].block_value == block_value
			{
				list[|0].ping_self(cell_x, cell_y) //ping block to move to self
				pinged = true //set pinged to true
			}
			
		}
	}
	else
	{
		list = instances_in_cell(cell_x, cell_y, obj_block, true)
		if list != 0
		{
			instance_destroy(list[|0])
			completed = true
		}
	}
}