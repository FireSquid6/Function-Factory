event_inherited()

image_blend = c_orange
dir = 0
offset_x = CELL_SIZE
offset_y = 0

on_place = function()
{
	//get value
	block_value = tool_ref.block_value
	
	//get scribble text
	text = scribble(string(block_value))
	text.starting_format("fnt_droid_sans_mono", c_black)
	text.align(fa_center, fa_middle)
}

on_modify = function()
{
	//move away
	x += CELL_SIZE / 2
	y += CELL_SIZE / 2
	
	//rotate
	dir += 90
	dir = loop(dir, 0, 359)
	
	//move back
	x -= CELL_SIZE / 2
	y -= CELL_SIZE / 2
	
	//hard code moving
	switch dir
	{
		case 0:
			offset_x = CELL_SIZE
			offset_y = 0
			break
		case 90:
			offset_x = 0
			offset_y = 0
			break
		case 180:
			offset_y = CELL_SIZE
			offset_x = 0
			break
		case 270:
			offset_x = CELL_SIZE
			offset_y = CELL_SIZE
			break
	}
}

event_start = function()
{
	//create the block ~22 pixels away from self
}