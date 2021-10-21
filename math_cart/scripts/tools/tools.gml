function tool_parent() constructor
{
	created_entity = noone
	use = function()
	{
		
	}
	
	destroy = function()
	{
		
	}
	
	modify = function()
	{
		
	}
	
	element = undefined
}

function tool_rail(_color) : tool_parent() constructor
{
	//make sure that there is a chosen color
	if argument_count < 1
	{
		_color = c_white
	}
	
	rail_color = _color
	created_entity = obj_rail
	
	//methods
	use = function()
	{
		var cell_x = obj_player.cell_x
		var cell_y = obj_player.cell_y
		
		var has_wall = cell_has_wall(cell_x, cell_y)
		var in_cell = instances_in_cell(cell_x, cell_y, obj_rail, true)
		
		if (in_cell == 0 && !has_wall) 
		{
			place_entity(cell_x, cell_y, created_entity, "lay_rails", self)
		}
	}
	
	destroy = function()
	{
		var list = instances_in_cell(obj_player.cell_x, obj_player.cell_y, created_entity, true)
		
		for (var i = 0; i < ds_list_size(list); i++)
		{
			var target = ds_list_find_value(list, i)
			if is_rail(target, rail_color) 
			{
				target.on_destroy()
			}
		}
	}
}

function tool_dispenser() : tool_parent() constructor
{
	created_entity = obj_dispenser
	use = function()
	{
		//make sure nothing is in the spot
		var cell_x = obj_player.cell_x
		var cell_y = obj_player.cell_y
		
		var has_wall = cell_has_wall(cell_x, cell_y)
		var in_cell = instances_in_cell(cell_x, cell_y, obj_rail, true)
		
		if (in_cell == 0 && !has_wall) 
		{
			//TODO: make a popup library to get text input for number
			block_value = 15
			place_entity(cell_x, cell_y, created_entity, "lay_level", self)
		}
		
	}
	
	modify = function()
	{
		var list = instances_in_cell(obj_player.cell_x, obj_player.cell_y, created_entity, true)
	}
}