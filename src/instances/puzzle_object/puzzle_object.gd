extends Node
class_name PuzzleObject


var cell_position = Vector2(0, 0)
var grid = null


# get grid node and connect signals
func initialize():
	grid = get_parent().get_parent()
	grid.connect()


func on_entity_placed(entity):
	pass


func on_entity_destroyed(entity):
	pass


func on_block_spawned(block):
	pass


func on_tile_placed(submap, tile_id, tile_position):
	pass


func on_puzzle_restarted():
	pass


func on_puzzle_stopped():
	pass


func on_puzzle_completed():
	pass


func on_grid_update():
	pass


func on_entity_update():
	pass


func on_block_update():
	pass


func on_submap_update():
	pass
