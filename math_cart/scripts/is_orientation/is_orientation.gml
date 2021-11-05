function is_node(orientation)
{
	return ((orientation == global.rail_orientations.nodes.isolated) || (orientation == global.rail_orientations.nodes.right) 
	|| (orientation == global.rail_orientations.nodes.left) || (orientation == global.rail_orientations.nodes.up) ||
	(orientation == global.rail_orientations.nodes.down))
}

function is_turn(orientation)
{
	return ((orientation == global.rail_orientations.corners.top_right) || (orientation == global.rail_orientations.corners.top_left) 
	|| (orientation == global.rail_orientations.corners.bottom_right) || (orientation == global.rail_orientations.corners.bottom_left))
}