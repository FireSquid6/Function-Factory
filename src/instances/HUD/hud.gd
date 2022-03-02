extends Control


const max_tools = 8

onready var vbox = get_node("Toolbox/CenterContainer/VBoxContainer")
onready var toolbox = get_node("Toolbox")

onready var mouse_in_ui = false

signal change_tool(tool_index)

func _process(delta):
	Global.hud_ref = self


func add_tool(linked_index, sprite):
	pass


func _on_CenterContainer_mouse_entered():
	mouse_in_ui = true


func _on_CenterContainer_mouse_exited():
	mouse_in_ui = false
