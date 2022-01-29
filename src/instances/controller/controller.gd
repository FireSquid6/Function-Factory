extends Node2D

# CONSTANTS
const PLACEABLE_ENTITIES = {
	"rail" : preload("res://instances/entities/rail/rail.tscn")
}
enum MODES {
	INACTIVE,
	EDITING,
	PLAYING
}

# VARS
onready var Cursor = get_node("Cursor")
onready var Entities = get_node("Entities")
onready var placed_entities = [] # list of all currently active entities, used for events system

export var mode = MODES.EDITING

var input_place
var input_remove
var input_modify


# METHODS
func _ready():
	Global.controller = self


func _process(delta):
	# get inputs
	input_place = Input.is_action_just_pressed("place")
	input_remove = Input.is_action_just_pressed("remove")
	input_modify = Input.is_action_just_pressed("modify")
	
	# state machine
	match mode:
		MODES.EDITING:
			editing()
		MODES.INACTIVE:
			pass
		MODES.PLAYING:
			playing()


func editing():
	if input_place:
		# create the new instance
		var new_entity = PLACEABLE_ENTITIES["rail"].instance()
		Entities.add_child(new_entity)


func playing():
	pass
