function rail_in_cell(cell_x, cell_y, color)
{
	var list = instances_in_cell(cell_x, cell_y, obj_rail, false)
	if list == 0
	{
		return noone
	}
	
	for (var i = 0; i < ds_list_size(list); i++)
	{
		if list[| i].image_blend == color 
		{
			return list[|i]
		}
	}
}