extends TileMap


# get nodes and load resources
onready var update_timer = get_node("update_timer")

# declare signals
signal entity_placed(entity)
signal entity_destroyed(entity)
signal block_spawned(block)
signal tile_placed(submap, tile_id, cell_position)
signal puzzle_restarted()
signal puzzle_stoped()
signal puzzle_completed()
signal grid_update()
signal entity_update()
signal submap_update()
signal block_update()

# declare exported variables
export var stored_submaps = []
export var stored_entities = []
export var stored_blocks = []

export var update_speed = 0.2


# METHODS
func entities_in_cell(cell_position):
	pass


func submaps_in_cell(cell_position):
	pass


func request_move(start_position, move_position, requester):
	pass


func request_place(place_position, entity):
	pass


func request_spawn(spawn_position, value):
	pass


func request_tile(tile_position, submap, tile_id):
	pass


# PROCESSES
func _process(delta):
	pass


func _ready():
	pass
