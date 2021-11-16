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