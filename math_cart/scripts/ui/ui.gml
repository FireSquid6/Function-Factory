function toolbox_tool(_sprite, _outline, _pos) : modui_button_sprite(_sprite, 1, 0, 0) constructor
{
	array_position = _pos
	outline_sprite = _outline
	
	add_method(MODUI_EVENTS.INIT, function()
	{
		//move to correct position
		if array_position <= MAX_PLAYER_TOOL_INDEX //if a player tool, add to toolbox area
		{
			var xx = 0, yy = global.square_top
			
			//move y
			yy += global.tool_sprite_height div 2 //move by first offset
			yy += global.tool_sprite_height * 2 * array_position //move based on position
			
			//floor x and y
			xx = floor(xx)
			yy = floor(yy)
			
			//transform
			transform(xx, yy, 1, 1)
		}
		else //if a designer tool, add to different menu
		{
			
		}
	})
	add_method(MODUI_EVENTS.PRESSED, function()
	{
		obj_player.tool_selected = array_position
	})
	
	add_method(MODUI_EVENTS.POSTDRAW, function()
	{
		//if player's selected tool equals array_position, draw an outlin
		if obj_player.tool_selected == array_position
		{
			draw_sprite_ext(outline_sprite, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
		}
	})
}

function get_toolbox_canvas(toolbox)
{
	var canvas = new modui_canvas()
	for (var i = 0; i < array_length(toolbox); i++)
	{
		var element = new toolbox_tool(toolbox[i].sprite, toolbox[i].outline, i)
		canvas.add_element(element)
	}
	
	return canvas
}
