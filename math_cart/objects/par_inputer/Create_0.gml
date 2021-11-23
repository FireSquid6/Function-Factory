event_inherited()

input_x = []
input_y = []

output_x = []
output_y = []

dir = 0
offset_x = CELL_SIZE
offset_y = 0

rotate = function()
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