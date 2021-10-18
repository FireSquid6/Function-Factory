orientation = global.rail_orientations.nodes.isolated
image_xscale = 64
image_yscale = 64
link_left = false

//links to image_index function
//can_link function

on_place = function()
{
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
	//this code sucks
	//update the surrounding rails' links
	if instance_exists(top_id) top_id.link_bottom = link_top
	if instance_exists(right_id) right_id.link_left = link_right
	if instance_exists(left_id) left_id.link_right = link_left
	if instance_exists(bottom_id) bottom_id.link_top = link_bottom
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

on_modify = function()
{
	//do nothing, this shouldn't be needed
}

on_tick = function()
{
	//check if a number block is in my grid
	//if I am an angle:
		//change the number block's direction
}

//on placed = unforced
//on modify = forced
//on destroy = forced