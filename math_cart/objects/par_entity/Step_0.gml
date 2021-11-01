var size = array_length(global.events)
for (var i = 0; i < size; i++)
{
	if object_index == obj_block
	{
		imposter = "sus"
	}
	var str = global.events[i]
	var met = variable_instance_get(id, str)
	if is_method(met) met()
}

if global.editing
{	
	edit_step()
}
else
{
	play_step()
}