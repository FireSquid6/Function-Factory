extends Node

# constants
const CELL_SIZE = 16

# variables
var controller_ref = null

# methods
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# returns the amount of entities in a specified cell
func entities_in_cell(cx, cy, entity_class = Entity):
	return null
