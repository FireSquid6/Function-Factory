extends Camera2D

export var pan_spd = 300

var pan_hor
var pan_vert

var x_side_dist
var y_side_dist

func _ready():
	Global.camera = self
	var map_limits = Global.tilemap.get_used_rect()
	var map_cellsize = Global.tilemap.cell_size
	
	limit_left = map_limits.position.x * map_cellsize.x
	limit_right = map_limits.end.x * map_cellsize.x
	limit_top = map_limits.position.y * map_cellsize.y
	limit_bottom = map_limits.end.y * map_cellsize.y
	
	x_side_dist = abs(position.x - $TopLeft.position.x)
	y_side_dist = abs(position.y - $TopLeft.position.y)

func _process(delta):
	# get input
	pan_hor = int(Input.is_action_pressed("pan_right")) - int(Input.is_action_pressed("pan_left"))
	pan_vert = int(Input.is_action_pressed("pan_down")) - int(Input.is_action_pressed("pan_up"))
	
	# move
	var pan_dir = Vector2(pan_hor, pan_vert).normalized()
	position += pan_dir * pan_spd * delta
	
	# clamp
	position.x = clamp(position.x, limit_left + x_side_dist, limit_right - x_side_dist)
	position.y = clamp(position.y, limit_top + y_side_dist, limit_bottom - y_side_dist)
