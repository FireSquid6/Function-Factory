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
	
	//get value
	block_value = tool_ref.block_value
	
	//get scribble text
	text = scribble(string(block_value))
	text.starting_format("fnt_droid_sans_mono", c_black)
	text.align(fa_center, fa_middle)
}

on_destroy = function()
{
	global.ejectors_required -= 1
}

event_start = function()
{
	check_x_addend = 0
	check_y_addend = 0
	switch dir
	{
		case 0:
			check_x_addend = 1
			break
		case 90:
			check_y_addend = -1
			break
		case 180:
			check_x_addend = -1
			break
		case 270:
			check_y_addend = 1
			break
	}
}

on_tick = function()
{
	if !pinged //if no block has been told to move into me
	{
		//check if there's a block in the cell i'm facing
		var list = instances_in_cell(cell_x + check_x_addend, cell_y + check_y_addend, obj_block, true)
	
		if list != 0
		{
			//check if it has the correct number
			var blockid = list[|0]
			if blockid.block_value == block_value
			{
				list[|0].ping_self(cell_x, cell_y) //ping block to move to self
				pinged = true //set pinged to true
			}
			
		}
	}
	else if !completed
	{
		list = instances_in_cell(cell_x, cell_y, obj_block, true)
		if list != 0
		{
			instance_destroy(list[|0])
			completed = true
			global.ejectors_completed ++
		}
	}
}