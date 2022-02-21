extends Camera2D


onready var move_x = 0
onready var move_y = 0
onready var velocity = 0
onready var zoom_dir = 0

export var pan_spd = 400
export var zoom_spd = 0.25


func _process(delta):
	# pan
	move_x = int(Input.is_action_pressed("pan_right")) - int(Input.is_action_pressed("pan_left"))
	move_y = int(Input.is_action_pressed("pan_down")) - int(Input.is_action_pressed("pan_up"))
	
	var dir = Vector2(move_x, move_y).normalized()
	velocity = dir * pan_spd * delta
	
	position += velocity
	
	# zoom
	zoom_dir = int(Input.is_action_just_pressed("zoom_out")) - int(Input.is_action_just_pressed("zoom_in"))
	zoom.x += zoom_dir * zoom_spd
	zoom.y += zoom_dir * zoom_spd
	
	zoom.x = clamp(zoom.x, zoom_spd, 8)
	zoom.y = clamp(zoom.y, zoom_spd, 8)
