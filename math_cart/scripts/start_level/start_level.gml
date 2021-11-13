function start_level()
{
	//reset globals
	global.ejectors_required = 0
	
	//set target
	global.target = obj_player
	
	//create manager objects
	instance_create_layer(0, 0, "lay_meta", obj_player)
	
	//get tilemap
	var layid = layer_get_id("tls_wall")
	global.wall_map = layer_tilemap_get_id(layid)
	
	show_debug_message("Level has been started")
}