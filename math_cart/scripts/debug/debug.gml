function sh_debug_mode(args)
{
	global.debug_mode = !global.debug_mode
	global.modui_debug = global.debug_mode
	global.user_preferences.debug_on = global.debug_mode
	
	return "Debug mode is now set to " + string(global.debug_mode) + "."
}

function meta_debug_mode()
{
	return 
	{
		description: "toggle debug mode on or off"
	}
}