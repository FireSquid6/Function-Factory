extends Tool
class_name EntityTool


export(PackedScene) var placed_entity

onready var grid_ref = null


func place(cell_position):
	if count > 0:
		var new_entity = placed_entity.instance()
		Global.grid_ref.request_place(cell_position, new_entity)
		count -= 1


func remove(cell_position):
	pass
