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

# references
onready var cursor_pos = Vector2(0, 0)
onready var cursor_box = null

onready var camera = null

onready var controller = null

onready var tilemap = null

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
