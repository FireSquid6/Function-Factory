//define rail states
//basically an enum
//comments afterwards represent priority
global.rail_orientations = 
{
	nodes :
	{
		isolated : 0, //11
		up : 1, //7
		right : 2, //8
		down : 3, //9
		left : 4 //10
	},
	
	sides : 
	{
		horizontal : 5, //2
		vertical : 6 //1
	},
	
	corners:
	{
		top_right : 7, //3
		bottom_right : 8, //5
		bottom_left : 9, //6
		top_left : 10 //4
	}
}

global.unforced_tops = 
[
	global.rail_orientations.nodes.down,
	global.rail_orientations.sides.vertical,
	global.rail_orientations.corners.bottom_right,
	global.rail_orientations.corners.bottom_left
]

global.unforced_rights =
[
	global.rail_orientations.nodes.left,
	global.rail_orientations.sides.horizontal,
	global.rail_orientations.corners.top_left,
	global.rail_orientations.corners.top_right
]

global.unforced_bottoms = 
[
	global.rail_orientations.nodes.up,
	global.rail_orientations.sides.vertical,
	global.rail_orientations.corners.top_right,
	global.rail_orientations.corners.top_left
]

global.unforced_lefts =
[
	global.rail_orientations.nodes.left,
	global.rail_orientations.sides.horizontal,
	global.rail_orientations.corners.top_left,
	global.rail_orientations.corners.top_right
]

//checks if a given object is a rail and in the same color as the other rail
function is_rail(_id, _color)
{
	if instance_exists(_id)
	{
		if _id.image_blend = _color
		{
			return true
		}
	}
	return false
}

//returns a list of all the possibilities a rail can be
function check_rails(xx, yy, color, force_all_possibilities)
{
	var array = []
	var on_top = false, on_right = false, on_bottom = false, on_left = false
	var top_id, right_id, bottom_id, left_id
	
	//get id's of all the things
	top_id = collision_point(x, y - CELL_SIZE, obj_rail, false, true)
	right_id = collision_point(x + CELL_SIZE, y, obj_rail, false, true)
	bottom_id = collision_point(x, y + CELL_SIZE, obj_rail, false, true)
	left_id = collision_point(x - CELL_SIZE, y, obj_rail, false, true)
	
	//check if there is a rail on each side
	on_top = is_rail(top_id, color)
	on_right = is_rail(top_id, color)
	on_bottom = is_rail(top_id, color)
	on_left = is_rail(top_id, color)
	
	//remove stuff for force_all_possibilities
	if !force_all_possibilities
	{
		on_top = array_has_value(global.unforced_tops, top_id.orientation)
		on_right = array_has_value(global.unforced_rights, right_id.orientation)
		on_bottom = array_has_value(global.unforced_tops, bottom_id.orientation)
		on_left = array_has_value(global.unforced_tops, left_id.orientation)
	}
	
	var around_me = on_top + on_bottom + on_left + on_right
	
	//add each type (in order of priority)
	if around_me > 1
	{
		//sides
		if on_top && on_bottom array_push(array, global.rail_orientations.sides.vertical)
		if on_left && on_right array_push(array, global.rail_orientations.sides.horizontal)
	
		//corners
		if on_right && on_top array_push(array, global.rail_orientations.corners.top_right)
		if on_bottom && on_right array_push(array, global.rail_orientations.corners.bottom_right)
		if on_bottom && on_left array_push(array, global.rail_orientations.corners.bottom_left)
		if on_top && on_left array_push(array, global.rail_orientations.corners.top_left)
	}
	else
	{
		//nodes
		if on_top array_push(array, global.rail_orientations.nodes.up)
		if on_right array_push(array, global.rail_orientations.nodes.right)
		if on_bottom array_push(array, global.rail_orientations.nodes.bottom)
		if on_left array_push(array, global.rail_orientations.nodes.left)
		
		//if the rail still has no friends, make it a starting node
		if array_length(array) < 1
		{
			array_push(array, global.rail_orientations.nodes.isolated)
		}
	}
	
	//return the array
	return array
	
}

//forces the surrounding rails to fit to the selected rail
function force_surrounding_rails()
{
	
}