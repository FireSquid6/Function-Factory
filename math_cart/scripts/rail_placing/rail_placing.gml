// THIS SCRIPT IS DEPRECATED

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
		horizontal : 6, //2
		vertical : 5 //1
	},
	
	corners:
	{
		top_right : 7, //3
		bottom_right : 8, //5
		bottom_left : 9, //6
		top_left : 10 //4
	},
	
	inputs:
	{
		up : 13,
		right : 14,
		down : 12,
		left: 11
	}
}

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

//check if two rails can link
function can_link(selfid, otherid)
{
	if is_rail(otherid, selfid.image_blend)
	{
		if otherid.links < 2 && selfid.links < 2
		{
			return true
		}
	}
	return false
}

//returns the orientation based on which directions the rail needs to link to
function get_orientation(link_top, link_left, link_right, link_bottom)
{
	var links = link_top + link_right + link_bottom + link_left
	
	if links == 2
	{
		if link_top && link_bottom return global.rail_orientations.sides.vertical
		if link_left && link_right return global.rail_orientations.sides.horizontal
		
		if link_top && link_right return global.rail_orientations.corners.top_right
		if link_top && link_left return global.rail_orientations.corners.top_left
		if link_bottom && link_right return global.rail_orientations.corners.bottom_right
		if link_bottom && link_left return global.rail_orientations.corners.bottom_left
	}
	else if links == 1
	{
		if link_top return global.rail_orientations.nodes.up
		if link_bottom return global.rail_orientations.nodes.down
		if link_right return global.rail_orientations.nodes.right
		if link_left return global.rail_orientations.nodes.left
	}
	else
	{
		return global.rail_orientations.nodes.isolated
	}
	
	show_error("SOMETHING HAS GONE WRONG WITH RAILS", true)
}
