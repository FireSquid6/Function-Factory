extends Tool
class_name SubmapTool


export(PackedScene) var submap = load("res://instances/puzzle_objects/submaps/rails.tscn")

onready var submap_ref = submap.instance()

func _ready():
	Global.grid_ref.get_node("Submaps").add_child(submap_ref)


func place(cell_position):
	if count > 0:
		var placed = submap_ref.request_tile(cell_position, 0)
		if placed:
			count -= 1

func remove(cell_position):
	pass
