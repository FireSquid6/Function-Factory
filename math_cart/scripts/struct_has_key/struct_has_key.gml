function struct_has_value(value, struct)
{
	var names = variable_struct_get_names(struct)
	for (var i = 0; i < ds_list_size(names); i++)
	{
		if value == variable_struct_get(struct, names[| i])
		{
			return true
		}
	}
	
	return false
}