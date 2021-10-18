//get input
if global.editing
{
	switch global.controller_type
	{
		case CONTROLLERS.KEYBOARD_AND_MOUSE:
			key_use = mouse_check_button(mb_left)
			key_modify = mouse_check_button_pressed(mb_middle)
			key_destroy = mouse_check_button(mb_right)
			cursor_x = mouse_x
			cursor_y = mouse_y
			
			break
		case CONTROLLERS.GAMEPAD:
			
			break
		case CONTROLLERS.TOUCH:
			
			break
	}

	//get cell location
	cell_x = cursor_x div CELL_SIZE
	cell_y = cursor_y div CELL_SIZE

	pixel_x = cell_x * CELL_SIZE
	pixel_y = cell_y * CELL_SIZE


	//TODO: change selected tool
	
	
	//do input
	var tool = toolbar[tool_selected]

	if key_use tool.on_use()
	if key_modify tool.on_modify()
	if key_destroy tool.on_destroy()
	
	//TODO: add play button when space pressed
	
}
else
{
	
}