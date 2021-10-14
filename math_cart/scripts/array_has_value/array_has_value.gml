function array_has_value(array, value)
{
	for (var i = 0; i < array_length(array); i++)
	{
		if array[i] == value
		{
			return true
			break
		}
	}
	
	return false
}