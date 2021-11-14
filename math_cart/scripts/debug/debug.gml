function sh_toggle_debug(args)
{
	global.debug_mode = !global.debug_mode
	global.modui_debug = global.debug_mode
	return "Debug mode is now set to " + string(global.debug_mode) + "."
}

function meta_toggle_debug()
{
	return 
	{
		description: "toggle debug mode on or off"
	}
}