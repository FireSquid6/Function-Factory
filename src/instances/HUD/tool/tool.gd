extends TextureRect
class_name Tool

var selected_material = preload("res://instances/HUD/tool/clicked_material.tres")
var hovered_material = preload("res://instances/HUD/tool/selected_material.tres")
onready var hud = get_parent().get_parent().get_parent().get_parent()
onready var label = get_node("Label")

onready var hovered = false
onready var selected = false

export var count = INF

func _ready():
	hud.connect("tool_clicked", self, "on_tool_clicked")


func _process(_delta):
	# set label text
	label.text = str(count)
	
	# check if mouse is inside rect
	hovered = (Rect2(rect_global_position, rect_size).has_point(get_global_mouse_position()))
	
	# if clicked
	if hovered and Input.is_action_pressed("click"):
		# emit a signal to change the current tool and set other stuff
		hud.emit_signal("tool_clicked", self)
	
	# figure out what material im supposed to have
	if selected:
		set_material(selected_material)
	elif hovered:
		set_material(hovered_material)
	else:
		set_material(null)


func set_sprite(sprite):
	texture = sprite


func on_tool_clicked(node):
	selected = (node == self)
	if selected:
		Global.grid_ref.tool_selected = self


func place(cell_position):
	pass


func remove(cell_position):
	pass
