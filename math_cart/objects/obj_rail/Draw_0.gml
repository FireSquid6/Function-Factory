draw_self()

if global.debug_mode
{
	var half_cell = CELL_SIZE div 2
	draw_text(x + half_cell, y, string(link_top))
	draw_text(x + CELL_SIZE - 6, y + half_cell, string(link_right))
	draw_text(x, y + half_cell, string(link_left))
	draw_text(x + half_cell, y + CELL_SIZE - 6, string(link_bottom))
}