extends Node2D


onready var sprites = [
	get_node("Sprites/RailUp"),
	get_node("Sprites/RailRight"),
	get_node("Sprites/RailDown"),
	get_node("Sprites/RailLeft")
]
onready var iso_rail = get_node("Sprites/RailIso")

onready var link_list = [false, false, false, false]
onready var link_amount = 0


func _process(delta):
	# set correct rails
	link_amount = 0
	for i in range(0, len(link_list)):
		
		if link_list[i] == true:
			link_amount += 1 # add 1 to the link amount
			sprites[i].visible = true # set that sprite visible
		
	# set rail iso to true if neccessary
	if link_amount < 2:
		iso_rail.visible = true
