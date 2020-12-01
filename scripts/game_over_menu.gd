extends Node

signal next_level
var menu_opened = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE) and !menu_opened:
		get_tree().paused = true
		display_pause_menu()

func _on_ExitButton_pressed():
	get_tree().quit()
	
func _on_PlayAgainButton_pressed():
	get_tree().reload_current_scene()
	
func _on_ResumeButton_pressed():
	hide_menu()
	get_tree().paused = false
		
func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_NextLevelButton_pressed():
	get_parent().to_next_level()
	
func hide_menu():
	menu_opened = false
	$Menu.hide()

func display_game_over_menu():
	menu_opened = true
	$Menu.show()
	$Menu/CenterContainer/VBoxContainer/NextLevelButton.hide()
	$Menu/LevelPassed.hide()
	$Menu/CenterContainer/VBoxContainer/ResumeButton.hide()
	$Menu/CenterContainer/VBoxContainer/PlayAgainButton.show()
	$Menu/CenterContainer/VBoxContainer/MainMenuButton.show()
	$Menu/CenterContainer/VBoxContainer/ExitButton.show()
	
func display_pause_menu():
	menu_opened = true
	$Menu.show()
	$Menu/CenterContainer/VBoxContainer/NextLevelButton.hide()
	$Menu/LevelPassed.hide()
	$Menu/CenterContainer/VBoxContainer/ResumeButton.show()
	$Menu/CenterContainer/VBoxContainer/MainMenuButton.show()
	$Menu/CenterContainer/VBoxContainer/ExitButton.show()

func display_level_cleared_menu():
	menu_opened = true
	$Menu.show()
	$Menu/LevelPassed.show()
	$Menu/CenterContainer/VBoxContainer/NextLevelButton.show()
	$Menu/CenterContainer/VBoxContainer/ResumeButton.hide()
	$Menu/CenterContainer/VBoxContainer/MainMenuButton.show()
	$Menu/CenterContainer/VBoxContainer/ExitButton.show()
