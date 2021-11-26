event_inherited()

image_blend = DISPENSER_COLOR
image_index =1

add_output(cell_x, cell_y - 1)

on_place = function()
{
	//get value
	block_value = tool_ref.block_value
	
	//get scribble text
	text = scribble(string(block_value))
	text.starting_format("fnt_droid_sans_mono", c_black)
	text.align(fa_center, fa_middle)
}

event_start = function()
{
	output_block(block_value, 0)
}

debug_draw = function()
{
	draw_io()
	draw_coordinates()
	draw_text(x, y-30, "DIR: "+string(dir))
}

surface_draw = function()
{
	draw_self_rotated()
	text.draw(x + sprite_width div 2, y + sprite_width div 2)
}