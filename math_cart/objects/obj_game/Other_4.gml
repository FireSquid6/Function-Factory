//check if in a level
var name = room_get_name(room)
global.in_level = (string_char_at(name,0) == "l" && string_char_at(name, 0) == "v")

if global.in_level
{	
	//create other manager objects
	instance_create_layer(0, 0, "lay_wires", obj_wires)
}