function loop(val, minimum, maximum)
{
	if val < minimum 
	{
		val = maximum 
	}
	else if val > maximum
	{
		val = minimum
	}
	return val
}