function sh_designer_mode(args)
{
	switch_design_mode(!global.designing)
	if global.designing
	{
		return "Now in designer mode"
	}
	else
	{
		return "Now in player mode"
	}
}

function meta_designer_mode(args)
{
	return 
	{
		description: "toggle whether designing a level or not"
	}
}