extends Control


const max_tools = 8

onready var vbox = get_node("Toolbox/CenterContainer/VBoxContainer")
onready var toolbox = get_node("Toolbox")

onready var mouse_in_ui = false

signal change_tool(tool_index)


func _process(delta):
	Global.hud_ref = self


func _on_CenterContainer_mouse_entered():
	mouse_in_ui = true


func _on_CenterContainer_mouse_exited():
	mouse_in_ui = false


func add_entity_tool(node, sprite, placed_entity, count):
	if vbox.get_child_count() < max_tools:
		vbox.add_child(node)
		
		node.set_sprite(sprite)
		node.placed_entity = placed_entity
		node.count = count


func add_tilemap_tool(node, sprite, tilemap, count):
	if vbox.get_child_count() < max_tools:
		vbox.add_child(node)
		
		node.set_sprite(sprite)
		node.submap = tilemap 
		node.count = count
