event_inherited()

//set vars
image_blend = EJECTOR_COLOR
image_index = 2
completed = false //whether the ejector has the correct value or not
pinged = false //whether the ejector has pinged a block to move into it

add_input(cell_x, cell_y - 1)

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
		var list = check_inputs()
		for (var i = 0; i < array_length(list); i++)
		{
			if list[i].block_value == block_value
			{
				pinged = true
				input_block(list[i])
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

surface_draw = function()
{
	draw_self_rotated()
	text.draw(x + sprite_width div 2, y + sprite_width div 2)
}