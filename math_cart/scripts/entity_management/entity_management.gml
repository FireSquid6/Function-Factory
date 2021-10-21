function broadcast_event(event)
{
	if !array_has_value(global.events, event)
	{
		array_push(global.events, event)
	}
}

function place_entity(cell_x, cell_y, obj, lay, tool, preplace_function = undefined)
{
	var inst = instance_create_layer(cell_x * CELL_SIZE, cell_y * CELL_SIZE, lay, obj)
	
	inst.tool_ref = tool
	if !is_undefined(preplace_function)
	{
		preplace_function()
	}
	inst.on_place()
	
	broadcast_event(global.EVENTS.ENTITY_PLACED)
	return inst
}

function destroy_entity(obj = -1, cell_x = 0, cell_y = 0)
{
	if obj == -1
	{
		obj = instances_in_cell(cell_x, cell_y, par_entity, true)[|0]
	}
	
	if obj.destrutable
	{
		obj.on_destroy()
		broadcast_event(global.EVENTS.ENTITY_DESTROYED)
		instance_destroy(obj)
	}
}

function modify_entity(obj)
{
	if obj.modable
	{
		obj.on_modify()
		broadcast_event(global.EVENTS.ENTITY_MODIFIED)
	}
}
