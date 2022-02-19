extends TileMap


# get children
onready var update_timer = get_node("update_timer")
onready var submap_container = get_node("Submaps")
onready var entity_container = get_node("Entities")
onready var block_container = get_node("Blocks")

# load entities
var dispenser = preload("res://instances/puzzle_objects/entities/dispenser/dispenser.tscn")

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

export var update_rate = 0.2

# other variables
onready var container_list = [entity_container, submap_container, block_container]
onready var storage_list = [stored_entities, stored_submaps, stored_blocks]


# CALLABLE METHODS
func connect_puzzle_object(node):
	# links the specified puzzle object to all user defined methods
	var signals = get_script().get_signal_list()
	for sig in signals:
		connect(sig, node, "on_" + sig)


func entities_in_cell(cell_position):
	var entities = []
	for entity in stored_entities:
		if entity.cell_position == cell_position:
			entities.append(entity)
	
	return entities


func submaps_in_cell(cell_position):
	var submaps = []
	for map in stored_submaps:
		if map.get_cellv(cell_position) != INVALID_CELL:
			submaps.append(map)
	
	return submaps


func request_move(start_position, move_position, requester):
	pass


func request_place(place_position, entity):
	pass


func request_spawn(spawn_position, value):
	pass


func request_tile(tile_position, submap, tile_id):
	pass


# PROCESSING METHODS
func _process(delta):
	pass


func _ready():
	# get all children
	for i in range(len(container_list)):
		var children = container_list[i].get_children()
		for child in children:
			storage_list[i].append(child)
			child.initialize()
