extends Entity
class_name Rail

signal process_links()

onready var sprites = [
	get_node("Sprites/RailUp"),
	get_node("Sprites/RailRight"),
	get_node("Sprites/RailDown"),
	get_node("Sprites/RailLeft")
	]
onready var iso_rail = get_node("Sprites/RailIso")
onready var can_process_links = true
onready var physics_processed = false

onready var box_list = [
	get_node("AdjacentCells/CellUp"), 
	get_node("AdjacentCells/CellRight"), 
	get_node("AdjacentCells/CellDown"),
	get_node("AdjacentCells/CellLeft")]

var link_list = [false, false, false, false]

var link_amount = 0

func create():
	z_index = Global.LAYERS.RAILS


func self_place(cell_pos):
	# get to new position
	position = cell_pos * Global.CELL_SIZE

func _physics_process(delta):
	# check which rails to link to
	if link_amount < 2:
		
		if Input.is_action_pressed("modify"):
			var imposter = "sus"
		
		for i in range(0, len(box_list)):
			# get the list of collided bodies in this box
			var collided = box_list[i].get_overlapping_areas()
			
			# if another rail is detected
			if len(collided) > 0:
				var other_rail = collided[0].get_parent()
				if other_rail.link_amount < 2 and other_rail != self: # if the other rail can be linked to and isn't just myself
					#get the other_index
					var other_index = i + 2
					if other_index > 3:
						other_index -= 4
					
					# change the link list
					link_list[i] = true
					other_rail.link_list[other_index] = true
					
					link_amount += 1
					other_rail.link_amount += 1
	
	# set correct rail sprites
	link_amount = 0
	for i in range(0, len(link_list)):
		
		if link_list[i] == true:
			link_amount += 1 # add 1 to the link amount
			sprites[i].visible = true # set that sprite visible
		
	# set rail iso to true if neccessary
	iso_rail.visible = (link_amount < 2)
	
	#print(str(self) + " at " + str(position) + "has the following links: " + str(link_list))
