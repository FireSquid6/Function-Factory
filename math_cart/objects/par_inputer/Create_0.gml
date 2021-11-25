event_inherited()

input_positions = []
output_positions = []

dir = 0
offset_x = CELL_SIZE
offset_y = 0

//adds an input to the input array
add_input = function(_cellX, _cellY)
{
	array_push(input_positions,
	{
		x : _cellY,
		y: _cellY
	})
}

//adds an output to the output array
add_output = function(_cellX, _cellY)
{
	array_push(output_positions,
	{
		x : _cellX,
		y : _cellY
	})
}


//creates a block and tells it to move into the output position of a specified index
output_block = function(_number, _index)
{
	var inst = instance_create_layer(x, y, "lay_numbers", obj_block)
	inst.block_value = _number
}

//checks if there's a block in all of hte inputs
//returns an array filled with the id of each block or noone
check_inputs = function()
{
	var xx, yy, list, array = [], target, set
	for (var i = 0; i < array_length(input_positions); i++)
	{
		set = false
		
		//get the numbers in the cell
		xx = input_positions[i].x
		yy = input_positions[i].y
		list = instances_in_cell(xx, yy, obj_block, false)
		
		//if there's something in the list
		if list != 0
		{
			target = list[| 0]
			
			//if the block isn't moving
			if !target.moving
			{
				array[i] = target.id //set the current array index to the target's id
				set = true //set the variable "set" to true
			}
		}
		
		if !set array[i] = noone
	}
}

//tells a specific block to come inside the inputer
//returns the block's value
input_block = function(_id)
{
	_id.ping_self(cell_x, cell_y)
	return _id.block_value
}

//rotates the object
rotate = function()
{	
	//rotate
	dir += 90
	dir = loop(dir, 0, 359)
	
	//CALCULATE THE NEW POSITION
	//get the point of rotation
	var px = x + (CELL_SIZE / 2)
	var py = y + (CELL_SIZE / 2)
	
	//get the difference between the current position and the point of rotation
	var xdiff = x - px
	var ydiff = y - py
	
	//get the new position
	x = px + (ydiff * -1)
	y = py + xdiff
	
	//CALCULATE IO ROTATIONS
}

on_modify = function()
{
	rotate()
}

draw_self_rotated= function()
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, dir - 90, image_blend, image_alpha)
}

debug_draw = function()
{
	//draw a square at every input position
	draw_set_color(c_green)
	draw_set_alpha(0.5)
	
	var xx, yy
	for (var i = 0; i < array_length(input_positions); i++) 
	{
		xx = input_positions[i].x * CELL_SIZE
		yy = input_positions[i].y * CELL_SIZE
		draw_rectangle(xx, yy, xx + CELL_SIZE - 1, yy + CELL_SIZE - 1)
	}
	
	//draw a square at every output position
	draw_set_color(c_red)
	draw_set_alpha(0.5)
	
	var xx, yy
	for (var i = 0; i < array_length(output_positions); i++) 
	{
		xx = input_positions[i].x * CELL_SIZE
		yy = input_positions[i].y * CELL_SIZE
		draw_rectangle(xx, yy, xx + CELL_SIZE - 1, yy + CELL_SIZE - 1)
	}
}