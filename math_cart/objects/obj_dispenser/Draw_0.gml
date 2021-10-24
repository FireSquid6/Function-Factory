draw_sprite_ext(sprite_index, image_index, x + offset_x, y + offset_y, image_xscale, image_yscale, dir - 90, image_blend, image_alpha)
text.draw(x + sprite_width div 2, y + sprite_width div 2)

if global.debug_mode
{
	draw_text(x, y, string(x))
	draw_text(x, y + 10, string(y))
	draw_text(x, y + 20, string(dir))
	draw_text(x, y + 40, string(x / CELL_SIZE))
	draw_text(x, y + 50, string(y / CELL_SIZE))
}