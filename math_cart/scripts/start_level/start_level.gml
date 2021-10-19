function start_level()
{
	//set target
	global.target = obj_player
	
	//create manager objects
	instance_create_layer(0, 0, "lay_meta", obj_player)
	
	//get tilemap
	var layid = layer_get_id("tls_wall")
	global.wall_map = layer_tilemap_get_id(layid)
}