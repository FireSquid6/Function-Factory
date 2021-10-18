#macro CELL_SIZE 64

global.editing = true //whether a level is playing or not
global.designing = true //whether all objects and save should be accessed

enum BORDER_COLORS
{
	RAIL = c_yellow,
	DELETING = c_red,
	PLACING = c_aqua,
	NONE = c_gray
}
show_debug_message("Player has been created")

global.broadcast_events = 
{
	place : false,
	destroy : false,
	modify : false
}

toolbar = [new tool_rail(PRIMARY_RAIL_COLOR)]
tool_selected = 0

cell_x = 0
cell_y = 0
border_color = BORDER_COLORS.RAIL

//gui stuff