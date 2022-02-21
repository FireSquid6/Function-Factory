extends Entity


# get children
onready var centerpoint = get_node("Centerpoint")
onready var output = get_node("Centerpoint/Output")


func _process(delta):
	if Devmode.debug_mode == true:
		$Debug.text = "position: " + str(position) + "\n" + "cell: " + str(cell_position)
	else:
		$Debug.text = ""


func modify():
	centerpoint.rotation_degrees += 90
