extends TextureRect
class_name Tool

var selected_material = preload("res://instances/HUD/tool/clicked_material.tres")
var hovered_material = preload("res://instances/HUD/tool/selected_material.tres")
onready var toolbox = get_parent().get_parent().get_parent()

onready var hovered = false
onready var selected = false


func _ready():
	toolbox.connect("tool_clicked", self, "on_tool_clicked")


func _process(_delta):
	# check if mouse is inside rect
	hovered = (Rect2(rect_global_position, rect_size).has_point(get_global_mouse_position()))
	
	# if clicked
	if hovered and Input.is_action_pressed("click"):
		# emit a signal to change the current tool and set other stuff
		toolbox.emit_signal("tool_clicked", self)
	
	# figure out what material im supposed to have
	if selected:
		set_material(selected_material)
	elif hovered:
		set_material(hovered_material)
	else:
		set_material(null)


func on_tool_clicked(node):
	selected = (node == self)


func place():
	pass


func remove():
	pass
