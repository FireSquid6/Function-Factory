event_inherited()

orientation = global.rail_orientations.nodes.isolated
links = 0

link_top = false
link_right = false
link_bottom = false
link_left = false

funnel = false
funnel_index = -1

tool_ref = -1

//EDITING FUNCTIONS
#region THIS CODE IS BAD DO NOT LOOK HERE
on_place = function()
{
	//get the correct color
	image_blend = tool_ref.rail_color
	
	//get which rails to link to 
	top_id = collision_point(x, y - CELL_SIZE, obj_rail, false, true)
	right_id = collision_point(x + CELL_SIZE, y, obj_rail, false, true)
	left_id = collision_point(x - CELL_SIZE, y, obj_rail, false, true)
	bottom_id = collision_point(x, y + CELL_SIZE, obj_rail, false, true)
	
	link_top = can_link(id, top_id)
	link_right = can_link(id, right_id)
	link_bottom = can_link(id, bottom_id)
	link_left = can_link(id, left_id)
	
	links = link_top + link_right + link_bottom + link_left
	
	//make sure the amount of possible links is less than 2
	if links > 2
	{
		//prioritize vertical rails
		if (link_top && link_bottom)
		{
			link_left = false
			link_right = false
		}
		else
		{
			link_top = false
			link_bottom = false
		}
	}
	
	//link to those rails
	orientation = get_orientation(link_top, link_left, link_right, link_bottom)

	//update the surrounding rails' links
	if instance_exists(top_id) top_id.link_bottom = link_top
	if instance_exists(right_id) right_id.link_left = link_right
	if instance_exists(left_id) left_id.link_right = link_left
	if instance_exists(bottom_id) bottom_id.link_top = link_bottom
	
	link_to_inputer()
}
#endregion

event_place = function()
{
	link_to_inputer()
}

event_modify = function()
{
	link_to_inputer()
}

event_destroy = function()
{
	link_to_inputer()
}

link_to_inputer = function()
{
	if links < 2
	{
		//check if there's an inputer I need to link to
		//create an array
		var inputer_list = 
		[
			collision_point(x, y - CELL_SIZE, par_inputer, false, true), //top
			collision_point(x + CELL_SIZE, y, par_inputer, false, true), //right
			collision_point(x - CELL_SIZE, y, par_inputer, false, true), //left
			collision_point(x, y + CELL_SIZE, par_inputer, false, true) //bottom
		]
	
		//stupid evil dumb hack to get it to detect inputers
		//add up all the elements
		//they will equal (-4 * (length - 1)) if there's no inputers around the rail since noone is really just -4 in disguise
		var array_total = 0
		var length = array_length(inputer_list)
		for (var i = 0; i < length; i++)
		{
			array_total += inputer_list[i]
		}
	
		if array_total != (-4 * length) //stupid evil hack based on the way gamemaker works
		{
			for (var i = 0; i < length; i++)
			{
				if inputer_list[i] != noone //if there is an id
				{
					var a = inputer_list[i].input_positions
					var b = inputer_list[i].output_positions
					var array = array_combine(a, b)
					var has_pos = false
					for (var j = 0; j < array_length(array); j++)
					{
						if array[j].x == cell_x && array[j].y == cell_y 
						{
							has_pos = true
						}
					}
				
					if has_pos //if the input object wants to accept blocks on my as an input
					{ 
						funnel = true
						switch i
						{
							case 0: //up
								funnel_index = global.rail_orientations.inputs.up
								break
							case 1: //right
								funnel_index = global.rail_orientations.inputs.right
								break
							case 2: //down
								funnel_index = global.rail_orientations.inputs.down
								break
							case 3: //left
								funnel_index = global.rail_orientations.inputs.left
								break
						}
						//exit the for loop
						break
					}
				}
			}
		}
	}
}

on_destroy = function()
{
	top_id = collision_point(x, y - CELL_SIZE, obj_rail, false, true)
	right_id = collision_point(x + CELL_SIZE, y, obj_rail, false, true)
	left_id = collision_point(x - CELL_SIZE, y, obj_rail, false, true)
	bottom_id = collision_point(x, y + CELL_SIZE, obj_rail, false, true)
	
	//for each linked surrounding rail, set link to self as false and reset orientation
	if link_top
	{
		with top_id
		{
			link_bottom = false
		}
	}
	
	if link_left
	{
		with left_id
		{
			link_right = false
		}
	}
	
	if link_right
	{
		with right_id
		{
			link_left = false
		}
	}
	
	if link_bottom
	{
		with bottom_id
		{
			link_top = false
		}
	}
	
	
	//destroy self
	instance_destroy()
}

edit_step = function()
{
	orientation = get_orientation(link_top, link_left, link_right, link_bottom)
	links = link_top + link_right + link_bottom + link_left + funnel
}

debug_draw = function()
{
	draw_coordinates()
	var half_cell = CELL_SIZE div 2
	draw_text(x + half_cell, y, string(link_top))
	draw_text(x + CELL_SIZE - 6, y + half_cell, string(link_right))
	draw_text(x, y + half_cell, string(link_left))
	draw_text(x + half_cell, y + CELL_SIZE - 6, string(link_bottom))
}

surface_draw = function()
{
	draw_self()
	if funnel 
	{
		draw_sprite_ext(spr_rail, funnel_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	}
}