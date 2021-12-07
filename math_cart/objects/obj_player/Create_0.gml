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
	PUZZLE_TICK: "on_tick",
	PUZZLE_TICK_START: "on_tick_start",
	PUZZLE_TICK_END: "on_tick_end"
}
#endregion

global.editing = true //whether a level is playing or not
global.designing = false //whether all objects and save should be accessed
global.tick_speed = 15 //time between each tick
global.toolbox_selected = false //whether the cursor is in the toolbox or not
global.events = [] //broadcasted events

in_gui = false

//setup toolbox
toolbox = [new tool_rail(c_white, infinity), new tool_dispenser(), new tool_ejector(), new tool_operator()]
tool_selected = 0
toolbox_selected = false
last_toolbox_selected = false

//setup railbox
railbox = []
railbox_selected = 0

//add stuff from leveldata
if instance_exists(obj_leveldata)
{
	var list = variable_instance_get_names(obj_leveldata)
	var rail, color, amount
	for (var i = 0; i < array_length(list); i++)
	{
		amount = variable_instance_get(obj_leveldata, list[i])
		color = global.rail_colors_array[clamp(i, 0, 2)]
		rail = new tool_rail(color, amount)
		array_push(railbox, rail)
	}
}

cell_x = 0
cell_y = 0
border_color = BORDER_COLORS.RAIL

//default gui height
var gui_width = display_get_gui_width()
var gui_height = display_get_gui_height()

#region Toolbox
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

#region Railbox

//create the canvas
railbox_canvas = new modui_canvas()

//add each element
var element, xx, yy
var offset = gui_width * 0.012

for (var i = 0; i < array_length(railbox); i++)
{
	//get x and y position
	xx = gui_width - (sprite_get_width(ico_rail_base) + offset)
	yy = gui_height - (sprite_get_height(ico_rail_base) + offset)
	
	yy -= i * (sprite_get_height(ico_rail_base) + offset)
	
	//create the element
	element = new modui_button_sprite(ico_rail_base, 1, xx, yy)
	element.image_blend = railbox[i].rail_color
	
	//add functions to it
	element.index = i
	element.outline_sprite = ico_rail_outline
	element.add_method(MODUI_EVENTS.PRESSED, function() {
		//when pressed, change the player's selected rail
		obj_player.railbox_selected = index
	})
	element.add_method(MODUI_EVENTS.POSTDRAW, function() {
		if obj_player.railbox_selected == index
		{
			//if my rail index is being selected, draw an outline
			draw_sprite_ext(outline_sprite, 1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha)
		}
		//if i'm selected
		else if selected
		{
			draw_sprite_ext(outline_sprite, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5)
		}
		
		//draw the amount left of my rail
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_font(fnt_droid_sans_mono)
		
		var num = obj_player.railbox[index].amount
		
		draw_text(x + 6, y + 6, string(num))
	})
	element.add_method(MODUI_EVENTS.SELECTED, function() {
		//If i'm selected, cancel player inputs
		with obj_player
		{
			key_use = false
			key_modify = false
			key_destroy = false
			in_gui = true
		}
	})
	
	//add the element to the canvas
	railbox_canvas.add_element(element)
}



#endregion