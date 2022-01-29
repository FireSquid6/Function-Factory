extends Node

# CONSTANT VARIABLES
# different z indecies
# uses multiples of 12 for easy division
const LAYERS = {
	"CURSOR" : 144,
	"UI" : 132,
	"ENTITIES": 72,
	"RAILS" : 48,
	"FLOOR" : 24
}
const CELL_SIZE = 16

# onready vars
onready var cursor_pos = Vector2(0, 0)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
