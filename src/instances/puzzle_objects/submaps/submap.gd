extends TileMap
class_name Submap

var grid = null


# get grid node and connect signals
func initialize():
	grid = get_parent().get_parent()
	grid.connect_puzzle_object(self)


func request_tile(tile_position, tile_index):
	return false
