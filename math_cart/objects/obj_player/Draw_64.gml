if global.debug_mode
{
	var rails = 0
	with obj_rail
	{
		rails ++
	}

	draw_text(0,0,string(rails))
}