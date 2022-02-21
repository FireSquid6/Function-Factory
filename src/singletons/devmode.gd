extends Node


var developer_mode = true
var debug_mode = false


func _process(delta):
	if Input.is_action_just_pressed("toggle_debug"):
		debug_mode = !debug_mode
