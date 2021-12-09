event_inherited()

#region define operation functions
add = function(n1, n2)
{
	return n1 + n2
}
subtract = function(n1, n2)
{
	return n1 - n2
}
multiply = function(n1, n2)
{
	return n1 * n2
}
divide = function(n1, n2)
{
	return n1 div n2
}
#endregion

dir = 0
operation = add
operation_symbol = "+"

add_input(cell_x, cell_y - 1)
add_input(cell_x + 1, cell_y)
add_output(cell_x, cell_y + 1)

block_cache = []

on_place = function()
{
	input = text_input("What operation should the operator perform (+, -, *, /)")
	switch input
	{
		case "+":
			operation = add 
			break
		case "-":
			operation = subtract
			break
		case "*":
			operation = multiply
			break
		case "/":
			operation = divide 
			break
	}
	
	switch operation
	{
		case add:
			operation_symbol = "+"
			break
		case subtract:
			operation_symbol = "-"
			break
		case multiply:
			operation_symbol = "×"
			break
		case divide:
			operation_symbol = "÷"
			break
		default:
			operation_symbol = "?"
			break
	}
}

on_tick = function()
{
	//tell all blocks in my input squares to move into me
	var array = check_inputs()
	for (var i = 0; i < array_length(array); i++)
	{  
		if array[i] != noone
		{
			array[i].ping_self(cell_x, cell_y)
		}
	}
	
	//delete all blocks inside of me and add them to my block_cache array
	var list = instances_in_cell(cell_x, cell_y, obj_block, false)
	if list != 0
	{
		for (var i = 0; i < ds_list_size(list); i++)
		{
			array_push(block_cache, list[| i].block_value)
			list[| i].on_destroy()
			instance_destroy(list[| i])
		}
	}
	
	//if block_cache is full, output a block
	if array_length(block_cache) == 2
	{
		var num = operation(block_cache[0], block_cache[1])
		output_block(num, 0)
		block_cache = []
	}
}

surface_draw = function()
{
	draw_self()
	
	var xx = variable_instance_get(id, corner_list[index].x)
	var yy = variable_instance_get(id, corner_list[index].y)
	draw_sprite_ext(spr_operator_io, image_index, xx, yy, image_xscale, image_yscale, corner_list[index].dir, image_blend, image_alpha)
}