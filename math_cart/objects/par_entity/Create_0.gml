cell_x = x div CELL_SIZE
cell_y = y div CELL_SIZE

//while playing
on_tick = function()
{
	
}

play_step = function()
{
	
}

//while editing
on_modify = function()
{
	
}

on_place = function() //when this object itself is placed
{
	
}

on_destroy = function()
{
	
}

edit_step = function()
{
	
}

//broadcasts
event_place = function()
{
	
}

event_destroy = function()
{
	
}

event_modify = function()
{
	
}

event_start = function()
{
	
}

event_stop = function()
{
	
}

event_complete = function()
{
	
}

//draw functions
surface_draw = function()
{
	draw_self()
}

debug_draw = function()
{
	draw_coordinates()
}

draw_coordinates = function()
{
	draw_set_color(c_white)
	draw_set_alpha(1)
	draw_set_font(fnt_default)
	draw_text(x, y, "CELLX: "+string(cell_x))
	draw_text(x, y+15, "CELLY: "+string(cell_y))
}

//other vars
destrutable = true
modable = true