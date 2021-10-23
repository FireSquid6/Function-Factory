event_inherited()

image_blend = c_orange
dir = 90

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
	//rotate
}

event_start = function()
{
	//create the block ~22 pixels away from self
}

edit_step = function()
{
	image_angle = dir - 90
}