x = display_mouse_get_x()
y = display_mouse_get_y()

//scale
var scale = (0.2 * sin(time)) + 1
time += 0.1

if time > 6.2831852989349 //midpoint between second and third extremum
{
	time = 0
}

image_xscale = scale
image_yscale = scale