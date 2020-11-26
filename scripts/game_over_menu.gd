extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Ball_out_of_screen():
	display_game_over_menu()

func _on_ExitButton_pressed():
	get_tree().quit()
	
func _on_PlayAgainButton_pressed():
	get_tree().reload_current_scene()
	
func _on_ResumeButton_pressed():
	$Menu.hide()
	get_tree().paused = false
		
func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	
func display_game_over_menu():
	$Menu.show()
	$Menu/CenterContainer/VBoxContainer/ResumeButton.hide()
	$Menu/CenterContainer/VBoxContainer/PlayAgainButton.show()
	$Menu/CenterContainer/VBoxContainer/ExitButton.show()
	
func display_pause_menu():
	$Menu.show()
	$Menu/CenterContainer/VBoxContainer/ResumeButton.show()
	$Menu/CenterContainer/VBoxContainer/ExitButton.show()
	




