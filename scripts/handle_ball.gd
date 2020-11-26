extends Node2D

signal out_of_screen

func _ready():
	pass # Replace with function body.


func _on_Ball_ball_exit():
	emit_signal("out_of_screen")
