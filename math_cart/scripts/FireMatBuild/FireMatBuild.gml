function __FireMat(_rows, _columns) constructor
{
	rows = _rows
	columns = _columns
	elements = ds_grid_create(columns, rows)
	
	static set_value = function(row, column, value)
	{
		ds_grid_add(elements, column, row, value)
	}
	
	static get_value = function(row, column)
	{
		return elements[# column, row]
	}
	
	static get_inverse = function()
	{
		if rows == columns
		{
			
		}
		return -1
	}
	
	static get_identity = function()
	{
		if rows == columns
		{
			
		}
		return -1
	}
	
	static get_determinant = function()
	{
		
	}
}

function FireMatBuild(rows, columns)
{
	return new __FireMat(rows, columns)
}