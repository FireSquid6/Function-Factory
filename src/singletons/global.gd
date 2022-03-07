extends Node


var grid_ref = null
var hud_ref = null

const level_file_extention = ".json"


func save_level_dict(level_name, grid, hud):
	var level_dict = {
		"submaps" : inst2dict(grid.get_node("Submaps")),
		"entities" : inst2dict(grid.get_node("Entities")),
		"toolbox" : inst2dict(hud.get_node("Toolbox"))
	}
	
	var string = JSON.print(level_dict)
	var new_file = File.new()
