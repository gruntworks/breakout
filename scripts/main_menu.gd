extends Node

var fade_finished = false
func _ready():
	pass # Replace with function body.


func _on_PlayButton_pressed():
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished():
	get_tree().change_scene("res://scenes/Main.tscn");


func _on_Exit_Button_pressed():
	get_tree().quit()
