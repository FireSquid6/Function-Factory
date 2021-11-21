function operator_input(searchx, searchy, operatorx, operatory) constructor
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
