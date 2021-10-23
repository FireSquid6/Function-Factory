#macro CELL_SIZE 64
#macro DISPENSER_OFFSET 16

global.editing = true //whether a level is playing or not
global.designing = true //whether all objects and save should be accessed
global.tick_speed = 15 //time between each tick

enum BORDER_COLORS
{
	RAIL = c_yellow,
	DELETING = c_red,
	PLACING = c_aqua,
	NONE = c_gray
}
show_debug_message("Player has been created")

global.EVENTS =
{
	ENTITY_PLACED : "event_place",
	ENTITY_DESTROYED : "event_destroy",
	ENTITY_MODIFIED : "event_modify",
	PUZZLE_STARTED : "event_start",
	PUZZLE_STOPPED : "event_stop",
	PUZZLE_COMPLETED : "event_complete",
	PUZZLE_TICK: "on_tick"
}

toolbox = [new tool_dispenser()]
tool_selected = 0

cell_x = 0
cell_y = 0
border_color = BORDER_COLORS.RAIL

//gui stuff
toolbox_canvas = new modui_canvas()
tooltray_canvas = new ui_tooltray()