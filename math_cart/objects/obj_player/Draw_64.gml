//toolbox
if global.designing
{
	if global.toolbox_selected 
	{
		toolbox_square.Draw()
		toolbox_canvas.draw()
	}
	else
	{
		unselected_toolbox.Draw()
	}
}
else
{
	railbox_canvas.draw()
}

//draw red outline if playing
var gui_width = display_get_width()
var gui_height = display_get_height()
if !global.editing
{
	draw_set_color(c_red)
	draw_line_width(0, 0, gui_width, 0, 10)
	draw_line_width(0, 0, 0, gui_height, 10)
	draw_line_width(0, gui_height, gui_width, gui_height, 10)
	draw_line_width(gui_width, gui_height, gui_width, 0, 10)
}