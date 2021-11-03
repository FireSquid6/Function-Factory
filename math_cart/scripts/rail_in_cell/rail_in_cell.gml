function rail_in_cell(cell_x, cell_y, color)
{
	var list = instances_in_cell(cell_x, cell_y, obj_rail, false)
	for (var i = 0; i < ds_list_size(list); i++)
	{
		list[| i].image_blend = color 
		{
			return list[|i]
		}
	}
}