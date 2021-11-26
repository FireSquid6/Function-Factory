event_inherited()

sprite = sprite_index
sprite_index = cell_mask

corner_list = 
[
	{
		x : "bbox_left",
		y : "bbox_top",
		dir: 0
	},
	{
		x : "bbox_right",
		y : "bbox_top",
		dir : 270
	},
	{
		x : "bbox_right",
		y : "bbox_bottom",
		dir: 180
	},
	{
		x : "bbox_left",
		y : "bbox_bottom",
		dir: 90
	}
]
index = 0

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
		y : _cellY
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
	index += 1
	if index > 3 index = 0
	
	//move io
	var target
	var varlist = ["input_positions", "output_positions"]
	for (var i = 0; i < array_length(varlist); i++)
	{
		var array = variable_instance_get(id, varlist[i])
		for (var j = 0; j < array_length(array); j++)
		{
			target = array[j]
			
			//move
			var _dir = point_direction(cell_x, cell_y, target.x, target.y)
			_dir -= 90
			_dir = loop(_dir, 0, 270)
			
			var ldirx = lengthdir_x(1, _dir)
			var ldiry = lengthdir_y(1, _dir)
			
			target.x = cell_x + ldirx
			target.y = cell_y + ldiry
			
			//set
			array[j] = target
		}
		
		variable_instance_set(id, varlist[i], array)
	}
}

on_modify = function()
{
	rotate()
}

draw_self_rotated= function()
{
	var xx = variable_instance_get(id, corner_list[index].x)
	var yy = variable_instance_get(id, corner_list[index].y)
	draw_sprite_ext(sprite, image_index, xx, yy, image_xscale, image_yscale, corner_list[index].dir, image_blend, image_alpha)
}

draw_io = function()
{
	//draw a square at every input position
	draw_set_color(c_green)
	draw_set_alpha(0.5)
	
	var xx, yy
	for (var i = 0; i < array_length(input_positions); i++) 
	{
		xx = input_positions[i].x * CELL_SIZE
		yy = input_positions[i].y * CELL_SIZE
		draw_rectangle(xx, yy, xx + CELL_SIZE - 1, yy + CELL_SIZE - 1, false)
	}
	
	//draw a square at every output position
	draw_set_color(c_red)
	draw_set_alpha(0.5)
	
	var xx, yy
	for (var i = 0; i < array_length(output_positions); i++) 
	{
		xx = output_positions[i].x * CELL_SIZE
		yy = output_positions[i].y * CELL_SIZE
		draw_rectangle(xx, yy, xx + CELL_SIZE - 1, yy + CELL_SIZE - 1, false)
	}
}

debug_draw = function()
{
	draw_io()
	draw_coordinates()
}