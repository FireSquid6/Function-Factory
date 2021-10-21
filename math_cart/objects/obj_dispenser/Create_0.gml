event_inherited()

image_blend = c_orange
dir = 0
value = tool_ref.block_value

on_place = function()
{
	//set value
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