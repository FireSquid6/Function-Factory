extends TextureRect


var clicked_material = preload("res://instances/HUD/tool/clicked_material.tres")
var selected_material = preload("res://instances/HUD/tool/selected_material.tres")

onready var selected = false
onready var clicked = false


func _on_Tool_mouse_entered():
	selected = true
	material = selected_material


func _on_Tool_mouse_exited():
	selected = false
	material = null


func _process(_delta):
	if selected and Input.is_action_pressed("click"):
		clicked = true
		# emit a signal to change the current tool and set other stuff
