extends Position2D

var cell_pos = Vector2(0, 0)

func _process(delta):
	position = get_global_mouse_position()
	cell_pos = position / Global.CELL_SIZE
