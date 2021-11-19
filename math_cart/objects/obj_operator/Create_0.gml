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

operator_input = function(searchx, searchy, operatorx, operatory) constructor
{
	x = searchx //cell position
	y = searchy //cell position
	
	ox = operatorx
	oy = operatory
	
	
	inside = function() //check if there's a block in the cell I search in
	{
		var list = instances_in_cell(x, y, obj_block, true)
		if list != 0
		{
			return list[| 0]
		}
		return noone
	}
	
	ping_block = function() //ping the block inside me to go into the operator
	{
		//get the blocks inside of me
		var block = inside()  
		
		//ping the block to the operator's position
		block.ping_self(ox, oy)
		
		//give the block an extra method to dilate itself
	}
	
	link_rails = function() //link any node rails inside my cell to the operator
	{
		//check for rails inside of me
		//give them an extra method to draw a triangle pointing towards the operator
	}
	
	debug_draw = function() //draw the cell im at in debug mode
	{
		//draw a rectangular outline in the cell im in
	}
}

operation = add
inputs = 
[
	{
		check_x_addend : 0,
		check_y_addend : 0
	}
]

event_start = function()
{
	check_x_addend = 0
	check_y_addend = 0
	switch dir
	{
		case 0:
			inputs[0].check_x_addend = 1
			break
		case 90:
			inputs[0].check_y_addend = -1
			break
		case 180:
			inputs[0].check_x_addend = -1
			break
		case 270:
			inputs[0].check_y_addend = 1
			break
	}
}

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
}

on_modify = function()
{
	var posmat = []
	var rotmat = []
	
	posmat[0][0] = x
	posmat[1][0] = y
}