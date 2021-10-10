function init_sprites()
{
	//basic box
	#macro BASIC_BOX_HEIGHT 128
	#macro BASIC_BOX_WIDTH 128
	var surf = surface_create(BASIC_BOX_WIDTH, BASIC_BOX_HEIGHT)
	
	surface_set_target(surf)
	
	shape = CleanRectangle(0, 0, BASIC_BOX_WIDTH, BASIC_BOX_HEIGHT)
	shape.Rounding(12)
	shape.Blend(c_white,1)
	
	shape.Draw()
	
	surface_save(surf,"basicbox.png")
	surface_reset_target()
	
	#region WALL TILESET
	//tileset box (unrounded)
	surf = surface_create(BASIC_BOX_WIDTH, BASIC_BOX_HEIGHT)
	surface_set_target(surf)
	
	shape = CleanRectangle(0, 0, BASIC_BOX_WIDTH, BASIC_BOX_HEIGHT)
	shape.Blend(WALL_COLOR, 1)
	
	shape.Draw()
	surface_save(surf,"tileset_box_unrounded.png")
	surface_reset_target()
	
	//tileset box (rounded)
	surf = surface_create(BASIC_BOX_WIDTH, BASIC_BOX_HEIGHT)
	surface_set_target(surf)
	
	shape.Rounding(12)
	shape.Border(4, c_gray, 1)
	
	shape.Draw()
	surface_save(surf,"tileset_box_rounded.png")
	surface_reset_target()
	
	//tileset box (border)
	surf = surface_create(BASIC_BOX_WIDTH, BASIC_BOX_HEIGHT)
	surface_set_target(surf)
	
	shape = CleanRectangle(0, 0, BASIC_BOX_WIDTH, BASIC_BOX_HEIGHT)
	shape.Blend(WALL_COLOR, 1)
	shape.Border(4, c_gray, 1)
	
	shape.Draw()
	surface_save(surf,"tileset_box_border.png")
	surface_reset_target()
	#endregion
	
	//floor
	surf = surface_create(BASIC_BOX_WIDTH, BASIC_BOX_HEIGHT)
	surface_set_target(surf)
	
	shape = CleanRectangle(0, 0, BASIC_BOX_WIDTH, BASIC_BOX_HEIGHT)
	shape.Blend(FLOOR_COLOR, 1)
	shape.Border(2, FLOOR_HIGHLIGHT, 1)
	
	shape.Draw()
	surface_save(surf,"floor_ts.png")
	surface_reset_target()
}