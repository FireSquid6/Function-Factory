//reset broadcast
global.events = []

//get input
switch global.controller_type
{
	case CONTROLLERS.KEYBOARD_AND_MOUSE:
		key_use = mouse_check_button(mb_left)
		key_modify = mouse_check_button_pressed(mb_middle) || keyboard_check_pressed(ord("R"))
		key_destroy = mouse_check_button(mb_right)
		
		cursor_x = mouse_x
		cursor_y = mouse_y
			
		key_start = keyboard_check_pressed(vk_space)
			
		break
	case CONTROLLERS.GAMEPAD:
		//TODO: implement this
		key_use = false
		key_modify = false
		key_destroy = false
		
		cursor_x = 0
		cursor_y = 0
		
		key_start = false
		break
	case CONTROLLERS.TOUCH:
		//TODO: implement this
		
		key_use = false
		key_modify = false
		key_destroy = false
		
		cursor_x = 0
		cursor_y = 0
		
		key_start = false
		break
}

//get cell location
cell_x = cursor_x div CELL_SIZE
cell_y = cursor_y div CELL_SIZE

pixel_x = cell_x * CELL_SIZE
pixel_y = cell_y * CELL_SIZE

//editing
if global.editing
{	
	//TODO: check if mouse is in collision with toolbox
	//update canvas
	if toolbox_selected
	{
		toolbox_canvas.update()
	}
	
	//if mouse in toolbox, set inputs to 0
	var top, left, bottom, right
	top = toolbox_square.__top
	bottom = toolbox_square.__bottom
	right = toolbox_square.__right
	left = toolbox_square.__left
	
	if point_in_rectangle(cursor_x, cursor_y, left, top, right, bottom)
	{
		key_use = false
		key_modify = false
		key_destroy = false
	}
	
	//do input
	global.tool = toolbox[tool_selected]

	if key_use global.tool.use()
	if key_modify global.tool.modify()
	if key_destroy global.tool.destroy()
	
	//TODO: add play button when space pressed
	if key_start
	{
		global.editing = false
		broadcast_event(global.EVENTS.PUZZLE_STARTED)
		//TODO: save current room state
		
		tick_time = 0
		global.tick_count = 0
	}
}
//playing
else
{
	//switch back to editing
	if key_start
	{
		global.editing = true
		broadcast_event(global.EVENTS.PUZZLE_STOPPED)
		//TODO: load previous room state
	}
	
	//tick management
	if tick_time <= 0
	{
		tick_time = global.tick_speed
		global.tick_count ++
		
		broadcast_event(global.EVENTS.PUZZLE_TICK)
	}
	tick_time --
}