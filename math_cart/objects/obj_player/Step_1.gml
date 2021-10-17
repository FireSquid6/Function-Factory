//get input
//TODO: add support for other platforms
if global.editing
{
	key_use = mouse_check_button(mb_left)
	key_modify = mouse_check_button_pressed(mb_middle)
	key_destroy = mouse_check_button_pressed(mb_right)
	cursor_x = mouse_x
	cursor_y = mouse_y

	//get cell location
	cell_x = cursor_x div CELL_SIZE
	cell_y = cursor_y div CELL_SIZE

	pixel_x = cell_x * CELL_SIZE
	pixel_y = cell_y * CELL_SIZE

	//TODO: broadcast events

	//TODO: change selected tool

	//do input
	var tool = toolbar[tool_selected]

	if key_use 
	{
		tool.on_use()
	}

	if key_modify
	{
		tool.on_modify()
	}

	if key_destroy
	{
		tool.on_destroy()
	}
}
else
{
	
}