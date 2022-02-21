extends TileMap


# define constants
const signal_prefex = "puzzle"
enum STATES {
	EDITING
	DESIGNING
	PLAYING
}

# get children
onready var update_timer = get_node("update_timer")
onready var submap_container = get_node("Submaps")
onready var entity_container = get_node("Entities")
onready var block_container = get_node("Blocks")

# load entities
var dispenser = preload("res://instances/puzzle_objects/entities/dispenser/dispenser.tscn")

# create toolbox
export var tool_selected = 0
onready var toolbox = [
	tool_entity.new(dispenser, self)]

# declare signals
signal puzzle_entity_placed(entity)
signal puzzle_entity_destroyed(entity)
signal puzzle_block_spawned(block)
signal puzzle_tile_placed(submap, tile_id, cell_position)
signal puzzle_restarted()
signal puzzle_stoped()
signal puzzle_completed()
signal puzzle_grid_update()
signal puzzle_entity_update()
signal puzzle_submap_update()
signal puzzle_block_update()


# declare exported variables
var stored_submaps = []
var stored_entities = []
var stored_blocks = []

export var update_rate = 0.2

# other variables
export var cursor_cell = Vector2.ZERO
export var cursor_position = Vector2.ZERO
export var state = STATES.DESIGNING


# CALLABLE METHODS
func connect_puzzle_object(node):
	# links the specified puzzle object to all user defined methods
	var signals = get_signal_list()
	for sig in signals:
		var name: String = sig["name"]
		if name.begins_with(signal_prefex):
			connect(name, node, "on_" + name)


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


func request_place(place_position, entity):
	var in_cell = entities_in_cell(place_position)
	if len(in_cell) > 0:
		return false
	else:
		stored_entities.append(entity)
		entity_container.add_child(entity)
		
		entity.initialize()
		entity.move_to(place_position)


func request_spawn(spawn_position, value):
	pass


func request_tile(tile_position, submap, tile_id):
	pass


# PROCESSING METHODS
func _process(delta):
	match state:
		STATES.DESIGNING:
			# get cursor position
			cursor_position = get_global_mouse_position()
			cursor_cell = (cursor_position / cell_size).floor()
			
			# place objects
			if Input.is_action_just_pressed("place"):
				toolbox[tool_selected].place(cursor_cell)
			
			# modify objects
			if Input.is_action_just_pressed("modify"):
				var in_cell = entities_in_cell(cursor_cell)
				if len(in_cell) > 0:
					for entity in in_cell:
						entity.modify()


func _ready():
	# get all predefined submaps
	var children = submap_container.get_children()
	for child in children:
		stored_submaps.append(child)
		child.initialize()


# TOOL CLASSES
class tool_entity:
	var placed_entity = null
	var grid_ref = null
	
	func _init(placed_entity, grid_ref):
		self.grid_ref = grid_ref
		self.placed_entity = placed_entity 
	
	func place(cell_position):
		var new_entity = placed_entity.instance()
		grid_ref.request_place(cell_position, new_entity)
