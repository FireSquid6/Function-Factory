#macro CELL_SIZE 64
#macro DISPENSER_OFFSET 16
#macro MAX_PLAYER_TOOL_INDEX 5


#region ENUMS
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
#endregion

global.editing = true //whether a level is playing or not
global.designing = true //whether all objects and save should be accessed
global.tick_speed = 15 //time between each tick
global.toolbox_selected = false //whether the cursor is in the toolbox or not
global.events = [] //broadcasted events

toolbox = [new tool_dispenser(), new tool_ejector(), new tool_operator()]
tool_selected = 0

cell_x = 0
cell_y = 0
border_color = BORDER_COLORS.RAIL
toolbox_selected = false
last_toolbox_selected = false

#region EVIL GUI STUFF DO NOT OPEN

//default gui height
var gui_width = display_get_gui_width()
var gui_height = display_get_gui_height()

//square coordinates
global.square_top = gui_height * 0.1 //top of the toolbox
global.square_bottom = gui_height * 0.9 //bottom of the toolbox

//square dimensions
global.square_width = gui_width * 0.1 //width of the toolbox
global.square_height = global.square_bottom - global.square_top //height of the toolbox

global.tools_amount = MAX_PLAYER_TOOL_INDEX + 1 //total amount of tools
global.tool_sprite_height = global.square_height div (global.tools_amount * 2)

//initiate the toolbox square
toolbox_square = CleanRectangle(-32, global.square_top, global.square_width, global.square_bottom)
toolbox_square.Blend(c_gray, 0.6)
toolbox_square.Border(16, c_dkgray, 1)
toolbox_square.Rounding(16)

unselected_toolbox = CleanRectangle(-32, global.square_top, 16, global.square_bottom)
unselected_toolbox.Blend(c_gray, 0.6)
unselected_toolbox.Border(16, c_dkgray, 1)
unselected_toolbox.Rounding(16)

//TODO: add stuff for designer box and 
//create the canvas
toolbox_canvas = get_toolbox_canvas(toolbox)

#endregion