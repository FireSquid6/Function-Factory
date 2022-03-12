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
	var entities = Global.grid_ref.entities_in_cell(cell_position)
	for entity in entities:
		if entity.get_filename() == placed_entity.get_path():
			Global.grid_ref.destroy_entity(entity)
