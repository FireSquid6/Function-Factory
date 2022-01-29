extends Entity
class_name Rail

signal process_links()

var sprites = [
	get_node("Sprites/RailUp"),
	get_node("Sprites/RailRight"),
	get_node("Sprites/RailDown"),
	get_node("Sprites/RailLeft")
	]
onready var iso_rail = get_node("Sprites/RailIso")
onready var can_process_links = true
onready var physics_processed = false

var link_list = [false, false, false, false]

var link_amount = 0

func create():
	z_index = Global.LAYERS.RAILS

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


func self_place(cell_pos):
	# get to new position
	position = cell_pos * Global.CELL_SIZE


func process_links():
	var box_list = [
	get_node("AdjacentCells/CellUp"), 
	get_node("AdjacentCells/CellRight"), 
	get_node("AdjacentCells/CellDown"),
	get_node("AdjacentCells/CellLeft")]

	# iterate through boxes
	for i in range(0, len(box_list)):
		# get the list of collided bodies in this box
		var collided = box_list[i].get_overlapping_areas()
		
		# iterate through those bodies
		for j in range(0, len(collided)):
			# check if the detected box can be collided with
			var other = collided[j].get_parent()
			if other.is_class("Rail"):
				if other.link_amount < 2:
					# set the correct links for self
					link_list[i] = true
					link_amount += 1
					
					# set collided object's links
					var other_i = i + 2
					if other_i > 3:
						other_i -= 1
					
					other.links[other_i] = true
					other.link_amount += 1
					
					# break
					break
		
		# break if link_amount > 1
		if link_amount > 1:
			break
	
	can_process_links = false
