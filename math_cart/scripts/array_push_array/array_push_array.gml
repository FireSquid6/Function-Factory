function array_push_array(array, append)
{
	for (var i = 0; i < array_length(append); i++)
	{
		array_push(array, append[i])
	}
	return array
}