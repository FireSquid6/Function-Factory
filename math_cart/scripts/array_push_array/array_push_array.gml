function array_combine(array1, array2)
{
	var newarray = []
	for (var i = 0; i < array_length(array1); i++)
	{
		array_push(newarray, array1[i])
	}
	for (var i = 0; i < array_length(array2); i++)
	{
		array_push(newarray, array2[i])
	}
	return newarray
}