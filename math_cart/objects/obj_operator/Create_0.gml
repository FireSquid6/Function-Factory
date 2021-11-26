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
raise_to = function(n1, n2)
{
	return power(n1, n2)
}

operator_symbols = 
{
	addition : "+",
	subtraction : "-",
	multiplication: "×",
	division : "÷",
	exponential : "^",
	equate : "=",
	modulus: "%"
}

#endregion

dir = 0
operation = add

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

surface_draw = function()
{
	draw_self_rotated()
	draw_sprite_ext(spr_operator_io, image_index, x, y, image_xscale, image_yscale, dir - 90, c_white, 1)
	text.draw(x + sprite_width div 2, y + sprite_width div 2)
}