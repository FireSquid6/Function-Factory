function sh_toggle_designing(args)
{
	global.designing = !global.designing
	if global.designing
	{
		//give all tools
		return "Now in designer mode"
	}
	else
	{
		//load in correct tools
		return "Now exiting designer mode"
	}
	
}

function meta_toggle_designing(args)
{
	return 
	{
		description: "toggle whether designing a level or not"
	}
}