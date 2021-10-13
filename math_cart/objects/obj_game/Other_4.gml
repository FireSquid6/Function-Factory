//check if in a level
var name = room_get_name(room)
var char0 = string_char_at(name,1)
var char1 = string_char_at(name,2)
global.in_level = (char0 == "l" && char1 == "v")

if global.in_level
{	
	start_level()
}