extends Entity


func _process(delta):
	$Debug.text = "position: " + str(position) + "\n" + "cell: " + str(cell_position)
