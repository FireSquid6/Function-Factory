function tool_parent() constructor
{
	sprite = spr_circle
	outline = noone
	
	bbox_left_offset = 0
	bbox_right_offset = 0
	bbox_top_offset = 0
	bbox_bottom_offset = 0
	
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
}

function tool_rail(_color = PRIMARY_RAIL_COLOR, _amount = 0) : tool_parent() constructor
{
	rail_color = _color
	max_amount = _amount
	amount = max_amount
	created_entity = obj_rail
	
	sprite = ico_rail_base
	outline = ico_rail_outline
	
	bbox_left_offset = 4
	bbox_right_offset = -4
	bbox_top_offset = 4
	bbox_bottom_offset = -4
	
	//methods
	use = function()
	{
		var cell_x = obj_player.cell_x
		var cell_y = obj_player.cell_y
		
		var in_cell = instances_in_cell(cell_x, cell_y, obj_rail, true)
		
		if in_cell == 0
		{
			if amount > 0
			{
				place_entity(cell_x, cell_y, created_entity, "lay_rails", self)
				amount --
			}
			else
			{
				//add some juice here later
			}
		}
	}
	
	destroy = function()
	{
		var list = instances_in_cell(obj_player.cell_x, obj_player.cell_y, created_entity, true)
		
		if list != 0
		{
			for (var i = 0; i < ds_list_size(list); i++)
			{
				var target = ds_list_find_value(list, i)
				if target.image_blend == rail_color
				{
					target.on_destroy()
					amount ++
				}
			}
		}
	}
}

function tool_barrier(color = PRIMARY_RAIL_COLOR) constructor
{
	
}

function tool_dispenser() : tool_parent() constructor
{
	created_entity = obj_dispenser
	input_text = "What number should the dispenser dispense?"
	
	sprite = ico_dispenser_base
	outline = ico_dispenser_outline
	
	bbox_left_offset = 3
	bbox_right_offset = -3
	bbox_top_offset = 3
	bbox_bottom_offset = -3
	
	use = function()
	{
		//make sure nothing is in the spot
		var cell_x = obj_player.cell_x
		var cell_y = obj_player.cell_y
		
		var in_cell = instances_in_cell(cell_x, cell_y, obj_rail, true)
		
		if (in_cell == 0) 
		{
			block_value = 0
			
			block_value = text_input(input_text)
			
			if !is_undefined(block_value)
			{
				place_entity(cell_x, cell_y, created_entity, "lay_level", self)
			}
		}	
	}
	
	modify = function()
	{
		var list = instances_in_cell(obj_player.cell_x, obj_player.cell_y, created_entity, true)
		if list != 0
		{
			list[|0].on_modify()
		}
	}
	
	destroy = function()
	{
		var instances = instances_in_cell(obj_player.cell_x, obj_player.cell_y, created_entity, true)
		if instances != 0
		{
			destroy_entity(instances[| 0], obj_player.cell_x, obj_player.cell_y)
		}
	}
}

function tool_ejector() : tool_dispenser() constructor
{
	sprite = ico_ejector_base
	outline = ico_ejector_outline
	
	created_entity = obj_ejector
	input_text = "What number does the ejector require?"
}

function tool_operator() : tool_dispenser() constructor
{
	sprite = ico_operator_base
	outline = ico_operator_outline
	
	bbox_left_offset = 1
	bbox_right_offset = -1
	bbox_top_offset = 1
	bbox_bottom_offset = -1
	
	created_entity = obj_operator
	use = function()
	{
		//make sure nothing is in the spot
		var cell_x = obj_player.cell_x
		var cell_y = obj_player.cell_y
		
		var in_cell = instances_in_cell(cell_x, cell_y, obj_rail, true)
		
		if (in_cell == 0) 
		{
			place_entity(cell_x, cell_y, created_entity, "lay_level", self)
		}
	}
}

//get the total amount of tools
//var list = variable_instance_get_names(global)
//var target = 0
//global.total_tools = 0

//for (var i = 0; i < array_length(list); i++)
//{
//	target = list[| i]
//	if (string_last_pos_ext("tool_", target, 1) !=0 && is_method(variable_instance_get(global, target)))
//	{
//		global.total_tools ++
//	}
//}
