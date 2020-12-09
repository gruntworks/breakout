extends Node

var current_level: int = 1
const TOTAL_LEVELS = 2

func level_up() -> void:
	if current_level <= TOTAL_LEVELS:
		current_level += 1
	
func get_level() -> Node:
	var level = load("res://levels/level_" + str(current_level) + ".tscn")
	return level.instance()

