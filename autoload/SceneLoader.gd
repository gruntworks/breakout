extends Node

onready var level_1 = preload("res://levels/level_1.tscn")
onready var level_2 = preload("res://levels/level_2.tscn")

var current_level = 1

func level_up():
	current_level += 1
	
func get_level():
	var level = load("res://levels/level_" + str(current_level) + ".tscn")
	return(level.instance());

