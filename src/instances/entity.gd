# base entity parent script
extends Node2D
class_name Entity


# VARIABLES
var layer = Global.LAYERS.ENTITIES

# METHODS
func create(): # extra stuff for ready that child entities can use
	pass

func _ready():
	z_index = layer
	if place_condition(Global.cursor_pos):
		self_place(Global.cursor_pos)
	
	create()


# function ran by the controller when attempting to place this entity
# needs to return either true or false
func place_condition(cell_pos):
	return true


# runs when this specific instance is placed
func self_place(cell_pos):
	position = cell_pos * Global.CELL_SIZE


# removes self from the scene
func self_remove():
	pass

# note: all global action methods run after their respective self methods
# runs whenever something is placed
func global_placed(obj):
	pass


# runs whenever something is placed
func global_removed(obj):
	pass


# runs whenever something is modified
func global_modified(obj):
	pass


# runs whenever the puzzle is stopped abruptly
func puzzle_stopped():
	pass


# runs whenever the puzzle is completed
func puzzle_completed():
	pass


# runs whenever a puzzle is started
func puzzle_started():
	pass
