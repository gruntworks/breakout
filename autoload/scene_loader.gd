extends Node

var current_level = 1
var total_scene_levels = 2

func level_up() -> void:
	if current_level <= total_scene_levels:
		current_level += 1
	
func get_level() -> Node:
	if current_level > total_scene_levels:
		return null
	else:
		var level = load("res://levels/level_" + str(current_level) + ".tscn")
		return level.instance()

