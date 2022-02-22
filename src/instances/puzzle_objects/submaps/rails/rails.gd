extends Submap



func request_tile(tile_position, _tile_index):
	if can_place(tile_position):
		# place the tile
		set_cell(tile_position.x, tile_position.y, 0)
		
		# update the autotile
		update_bitmask_region() # this is a slow way to do this but I'm lazy
		
		# return true
		return true
	
	return false

func is_open(x, y):
	var cell = get_cell(x, y)
	if cell != INVALID_CELL:
		var adjacent_cells = [
			(get_cell(x, y - 1) != INVALID_CELL),
			(get_cell(x + 1, y) != INVALID_CELL),
			(get_cell(x, y + 1) != INVALID_CELL),
			(get_cell(x - 1, y) != INVALID_CELL)
		]
		
		var total_adjacent = 0
		for i in adjacent_cells:
			total_adjacent += int(i)
		
		return (total_adjacent < 2)
	
	return true


func can_place(tile_position):
	# get the adjacent cells
	var adjacent_cells = [
		!is_open(tile_position.x, tile_position.y - 1),
		!is_open(tile_position.x + 1, tile_position.y),
		!is_open(tile_position.x, tile_position.y + 1),
		!is_open(tile_position.x - 1, tile_position.y)
	]
	
	# add up the total
	var total = 0
	for i in adjacent_cells:
		total += int(i)
	
	return (total == 0)
