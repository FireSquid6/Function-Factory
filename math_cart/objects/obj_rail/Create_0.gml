event_inherited()

orientation = global.rail_orientations.nodes.isolated
links = 0

link_top = false
link_right = false
link_bottom = false
link_left = false

tool_ref = -1

//EDITING FUNCTIONS
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

edit_step = function()
{
	orientation = get_orientation(link_top, link_left, link_right, link_bottom)
	links = link_top + link_right + link_bottom + link_left
}