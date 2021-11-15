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