function toolbox_tool(_sprite, _pos) : modui_button_sprite(_sprite, 1, 0, 0) constructor
{
	array_position = _pos
	
	add_method(MODUI_EVENTS.INIT, function()
	{
		//move to correct position
		if array_position <= MAX_PLAYER_TOOL_INDEX //if a player tool, add to toolbox area
		{
			var xx = 0, yy = global.square_top
			
			//move y
			yy += global.tool_sprite_height div 2 //move by first offset
			yy += global.tool_sprite_height * 2 * array_position //move based on position
			
			//scale
			sprite_width = sprite_get_width(sprite_index)
			if sprite_width != global.tool_sprite_height
			{
				var xscale = global.tool_sprite_height / sprite_width
				var yscale = global.tool_sprite_height / sprite_width
			}
			
			//move x
			xx += (global.square_width - (sprite_width * xscale)) div 2
			
			//floor x and y
			xx = floor(xx)
			yy = floor(yy)
			
			//transform
			transform(xx, yy, xscale, xscale)
		}
		else //if a designer tool, add to different menu
		{
			
		}
	})
	add_method(MODUI_EVENTS.PRESSED, function()
	{
		obj_player.tool_selected = array_position
	})
	
	if global.designing = true
	{
		add_method(MODUI_EVENTS.SELECTED, function()
		{
			//if right clicked switch from toolbox to designer area
		})
	}
	
	add_method(MODUI_EVENTS.UPDATE, function()
	{
		//make image slightly brighter if selected
	})
	add_method(MODUI_EVENTS.POSTDRAW, function()
	{
		//if player's selected tool equals array_position, draw an outline
	})
}

function get_toolbox_canvas(toolbox)
{
	var canvas = new modui_canvas()
	for (var i = 0; i < array_length(toolbox); i++)
	{
		var element = new toolbox_tool(spr_circle, i)
		canvas.add_element(element)
	}
	
	return canvas
}
