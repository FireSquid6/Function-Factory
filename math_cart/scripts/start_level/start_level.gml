function start_level()
{
	//set target
	global.target = obj_player
	
	//create manager objects
	instance_create_layer(0, 0, "lay_meta", obj_player)
}