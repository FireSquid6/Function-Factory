event_inherited()

image_blend = c_orange
dir = 0
offset_x = CELL_SIZE
offset_y = 0

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
	//move away
	x += CELL_SIZE / 2
	y += CELL_SIZE / 2
	
	//rotate
	dir += 90
	dir = loop(dir, 0, 359)
	
	//move back
	x -= CELL_SIZE / 2
	y -= CELL_SIZE / 2
	
	//hard code moving
	switch dir
	{
		case 0:
			offset_x = CELL_SIZE
			offset_y = 0
			break
		case 90:
			offset_x = 0
			offset_y = 0
			break
		case 180:
			offset_y = CELL_SIZE
			offset_x = 0
			break
		case 270:
			offset_x = CELL_SIZE
			offset_y = CELL_SIZE
			break
	}
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