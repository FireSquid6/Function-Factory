//get input
//TODO: add support for multiplatform
key_use = mouse_check_button(mb_left)
key_modify = mouse_check_button_pressed(mb_right)
cursor_x = mouse_x
cursor_y = mouse_y

//get cell location
cell_x = cursor_x div CELL_SIZE
cell_y = cursor_y div CELL_SIZE

pixel_x = cell_x * CELL_SIZE
pixel_y = cell_y * CELL_SIZE

//TODO: change selected tool

//place whatever
if key_use
{
	switch toolbar[tool_selected]
	{
		case "rail":
			
			break
		case "eraser":
			
			break
		case "wire":
			
			break
	}
}

//modify object
if key_modify
{
	
}