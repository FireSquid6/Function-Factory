extends Area2D
class_name PuzzleObject


var cell_position = Vector2(0, 0)
var grid = null


# get grid node and connect signals
func initialize():
	grid = get_parent().get_parent()
	grid.connect_puzzle_object(self)


func update_position():
	cell_position = (position / grid.cell_size).floor()


func move_to(new_position):
	position = new_position * grid.cell_size
	update_position()


func _process(delta):
	update_position()


# RECIEVED SIGNALS
func on_puzzle_entity_placed(entity):
	pass


func on_puzzle_entity_destroyed(entity):
	pass


func on_puzzle_block_spawned(block):
	pass


func on_puzzle_tile_placed(submap, tile_id, tile_position):
	pass


func on_puzzle_restarted():
	pass


func on_puzzle_stopped():
	pass


func on_puzzle_completed():
	pass


func on_puzzle_grid_update():
	pass


func on_puzzle_entity_update():
	pass


func on_puzzle_block_update():
	pass


func on_puzzle_submap_update():
	pass
