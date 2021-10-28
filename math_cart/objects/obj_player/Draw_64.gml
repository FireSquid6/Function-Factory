if global.debug_mode
{
	var gui_width = display_get_width()
	var gui_height = display_get_height()
	//draw red outline if playing
	if !global.editing
	{
		draw_set_color(c_red)
		draw_line_width(0, 0, gui_width, gui_height, 10)
		draw_line_width(0, 0, 0, gui_height, 10)
		draw_line_width(0, gui_height, gui_width, gui_height, 10)
		draw_line_width(gui_width, gui_height, gui_width, 0, 10)
	}
}

//toolbox
toolbox_square.Draw()
if toolbox_selected toolbox_canvas.draw()