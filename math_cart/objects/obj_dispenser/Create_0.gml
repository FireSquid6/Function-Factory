event_inherited()

image_blend = DISPENSER_COLOR

on_place = function()
{
	//get value
	block_value = tool_ref.block_value
	
	//get scribble text
	text = scribble(string(block_value))
	text.starting_format("fnt_droid_sans_mono", c_black)
	text.align(fa_center, fa_middle)
}

on_modify = function()
{
	rotate()
}

event_start = function()
{
	var inst = instance_create_layer(x, y, "lay_numbers", obj_block)
	inst.dir = dir
	inst.block_value = block_value
}

debug_draw = function()
{
	draw_coordinates()
	draw_text(x, y-30, "DIR: "+string(dir))
}

surface_draw = function()
{
	draw_sprite_ext(sprite_index, image_index, x + offset_x, y + offset_y, image_xscale, image_yscale, dir - 90, image_blend, image_alpha)
	text.draw(x + sprite_width div 2, y + sprite_width div 2)
}