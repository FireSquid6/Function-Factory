//reset broadcast
global.events = []

//reset in gui
in_gui = false

//get input
switch global.controller_type
{
	case CONTROLLERS.KEYBOARD_AND_MOUSE:
		key_use = mouse_check_button(mb_left)
		key_modify = mouse_check_button_pressed(mb_middle) || keyboard_check_pressed(ord("R"))
		key_destroy = mouse_check_button(mb_right)
		
		cursor_x = mouse_x
		cursor_y = mouse_y
		
		key_start = (keyboard_check_pressed(vk_space) && !obj_shell.isOpen)
			
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

#region EDITING
if global.editing
{	
	if global.designing
	{
		//if toolbox is selected
		if global.toolbox_selected
		{
			//update canvas
			toolbox_canvas.update(display_mouse_get_x(), display_mouse_get_y(), mouse_check_button(mb_left))
	
			//if mouse in toolbox, set inputs to 0
			var top, left, bottom, right
			top = toolbox_square.__top
			bottom = toolbox_square.__bottom
			right = toolbox_square.__right
			left = toolbox_square.__left
			if point_in_rectangle(cursor_x, cursor_y, left, top, right, bottom)
			{
				//set all inputs to false
				key_use = false
				key_modify = false
				key_destroy = false
				in_gui = true
			}
			//if the mouse isn't in the toolbox, set toolbox_selected to false
			else
			{
				global.toolbox_selected = false
			}
		}
		//if toolbox not selected
		else
		{
			//if the mouse is in the minibox, go to toolbox selected
			var top, left, bottom, right
			top = unselected_toolbox.__top
			bottom = unselected_toolbox.__bottom
			right = unselected_toolbox.__right
			left = unselected_toolbox.__left
			if point_in_rectangle(cursor_x, cursor_y, left, top, right, bottom)
			{
				global.toolbox_selected = true
			}
		}
	}
	else
	//if not designing, edit the railbox
	{
		railbox_canvas.update()
	}
	
	//PLACE OBJECTS
	if global.designing
	{
		global.tool = toolbox[tool_selected]
	}
	else
	{
		global.tool = railbox[railbox_selected]
	}

	if key_use global.tool.use()
	if key_modify global.tool.modify()
	if key_destroy global.tool.destroy()
	
	//TODO: add play button when space pressed
	if key_start
	{
		global.editing = false
		
		broadcast_event(global.EVENTS.PUZZLE_STARTED)
		
		tick_time = 0
		global.tick_count = 0
		global.ejectors_completed = 0
	}
}
#endregion
#region PLAYING
else
{
	//switch back to editing
	if key_start
	{
		global.editing = true
		broadcast_event(global.EVENTS.PUZZLE_STOPPED)
	}
	
	//tick management
	if tick_time <= 0
	{
		tick_time = global.tick_speed
		global.tick_count ++
		
		broadcast_event(global.EVENTS.PUZZLE_TICK_START)
		broadcast_event(global.EVENTS.PUZZLE_TICK)
		broadcast_event(global.EVENTS.PUZZLE_TICK_END)
	}
	tick_time --
	
	//check if puzzle is completed
	if global.ejectors_required == global.ejectors_completed
	{
		broadcast_event(global.EVENTS.PUZZLE_COMPLETED)
		global.editing = true
		//do whatever is neccessary for puzzle completion
	}
}
#endregion