function is_node(orientation)
{
	return ((orientation == global.rail_orientations.nodes.isolated) || (orientation == global.rail_orientations.nodes.right) 
	|| (orientation == global.rail_orientations.nodes.left) || (orientation == global.rail_orientations.nodes.top) ||
	(orientation == global.rail_orientations.nodes.bottom))
}

function is_turn(orientation)
{
	return ((orientation == global.rail_orientations.corners.top_right) || (orientation == global.rail_orientations.corners.top_left) 
	|| (orientation == global.rail_orientations.corners.bottom_right) || (orientation == global.rail_orientations.corners.bottom_left))
}