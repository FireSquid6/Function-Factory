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

//toolbox
var gui_width = display_get_gui_width()
var gui_height = display_get_gui_height()
var square_top = gui_height * 0.1
var square_bottom = gui_height * 0.9
var square_width = gui_width * 0.1

var toolbox_y_padding = gui_height * 0.05
var toolbox_x_offset = gui_width * 0.03

toolbox_square = CleanRectangle(-32, square_top, square_width, square_bottom)
toolbox_square.Blend(c_gray, 0.6)
toolbox_square.Border(16, c_dkgray, 1)
toolbox_square.Rounding(16)

//create the canvas
toolbox_canvas = new modui_canvas()
for (var i = 0; i <= array_length(toolbox); i++)
{
	
}