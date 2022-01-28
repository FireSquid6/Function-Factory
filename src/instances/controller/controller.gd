extends Node2D

# node references
onready var Cursor = get_node("Cursor")

# signals
signal _place(obj, cx, cy)
signal _remove(obj, cx, cy)
signal _modify(obj, cx, cy)

signal _puzzle_start()
signal _puzzle_stop()

# constants
enum MODES {
	EDITING,
	RUNNING
}

# variables
onready var mode = MODES.EDITING
var current_tool

# BUILT IN METHODS
func _process(delta):
	
	# give the global singleton a reference of myself
	Global.controller_ref = self

# CUSTOM METHODS
# runs whie the 
func editing():
	pass

# SIGNAL EMITTERS
# runs when the puzzle is stopped abruptly
# emits the singal "puzzle_stop"
func stop_puzzle():
	emit_signal("_puzzle_stop")

# runs when the puzzle is started
# emits the signal "puzzle_start"
func start_puzzle():
	emit_signal("_puzzle_start")
	
# runs when the puzzle is successfully completed
# called by the global singleton
func on_puzzle_completed():
	pass
