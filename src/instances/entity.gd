extends Node2D
class_name Entity
# base entity parent script

# function ran by the controller when attempting to place this entity
# needs to return either true or false
func place_condition(cx, cy):
	return true

