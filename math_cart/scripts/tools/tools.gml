function tool_parent() constructor
{
	created_entity = noone
	on_use = function()
	{
		
	}
	
	on_destroy = function()
	{
		
	}
	
	on_modify = function()
	{
		
	}
}

function tool_rail(_color) : tool_parent() constructor
{
	//make sure that there is a chosen color
	if argument_count < 1
	{
		_color = c_white
	}
	
	color = _color
	created_entity = obj_rail
	
	on_use = function()
	{
		var cell_x = obj_player.cell_x
		var cell_y = obj_player.cell_y
		
		//debug
		if keyboard_check(vk_space)
		{
			imposter = "sus"
		}
		
		//make sure there isn't an instance already there
		//var list = instances_in_cell(cell_x, cell_y, obj_rail, true)
		//if ds_list_size(list) != 0 exit
		
		//check if the rail is creating a turn
		
		//place the instance
		var inst = instance_create_layer(cell_x * CELL_SIZE, cell_y * CELL_SIZE, "lay_rails", created_entity)
		inst.image_blend = color
		inst.on_place()
	}
	
	on_destroy = function()
	{
		var list = instances_in_cell(obj_player.cell_x, obj_player.cell_y, created_entity, true)
		
		for (var i = 0; i < ds_list_size(list); i++)
		{
			var target = ds_list_find_value(list, i)
			if is_rail(target, color) 
			{
				target.on_destroy()
				instance_destroy(target)
			}
		}
	}
}