extends Node

var menu_opened: bool = false;

func _ready() -> void:
	$Menu.hide()
	for button in get_tree().get_nodes_in_group("menu_buttons"):
		button.connect("mouse_entered", self, "_on_menu_button_hover", [button])
		button.connect("pressed", self, "_on_menu_button_click", [button])
	
func _input(_event) -> void:
	if Input.is_key_pressed(KEY_ESCAPE) and !menu_opened:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		display_pause_menu()

func _on_ExitButton_pressed() -> void:
	yield($ButtonClickAudio, "finished")
	get_tree().quit()
	
func _on_PlayAgainButton_pressed() -> void:
	yield($ButtonClickAudio, "finished")
	FADE.fade_out()
	yield(FADE.get_node("tween"), "tween_completed")
	if get_tree().reload_current_scene() != OK:
		print("Current Scene reload failed")
	
func _on_ResumeButton_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	hide_menu()
	get_tree().paused = false
		
func _on_MainMenuButton_pressed() -> void:
	yield($ButtonClickAudio, "finished")
	FADE.fade_out()
	yield(FADE.get_node("tween"), "tween_completed")
	if get_tree().change_scene("res://scenes/MainMenu.tscn") != OK:
		print("Main Menu scene load failed")
	FADE.fade_in()
	
func _on_NextLevelButton_pressed() -> void:
	yield($ButtonClickAudio, "finished")
	FADE.fade_out()
	yield(FADE.get_node("tween"), "tween_completed")
	get_parent().to_next_level()

func _on_menu_button_hover(_button) -> void:
	$ButtonHoverAudio.play()
	
func _on_menu_button_click(_button) -> void:
	$ButtonClickAudio.play()
	
func hide_menu() -> void:
	menu_opened = false
	$Menu.hide()

func display_game_over_menu() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	menu_opened = true
	$Menu.show()
	$Menu/CenterContainer/VBoxContainer/NextLevelButton.hide()
	$Menu/CenterLabel/LevelPassed.hide()
	$Menu/CenterContainer/VBoxContainer/ResumeButton.hide()
	$Menu/CenterContainer/VBoxContainer/PlayAgainButton.show()
	$Menu/CenterContainer/VBoxContainer/MainMenuButton.show()
	$Menu/CenterContainer/VBoxContainer/ExitButton.show()
	
func display_pause_menu() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	menu_opened = true
	$Menu.show()
	$Menu/CenterContainer/VBoxContainer/NextLevelButton.hide()
	$Menu/CenterLabel/LevelPassed.hide()
	$Menu/CenterContainer/VBoxContainer/ResumeButton.show()
	$Menu/CenterContainer/VBoxContainer/MainMenuButton.show()
	$Menu/CenterContainer/VBoxContainer/ExitButton.show()

func display_level_cleared_menu() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	menu_opened = true
	$Menu.show()
	$Menu/CenterLabel/LevelPassed.show()
	
	if LOADER.current_level == LOADER.TOTAL_LEVELS:
		$Menu/CenterContainer/VBoxContainer/NextLevelButton.hide()
		$Menu/CenterLabel/LevelPassed.text = "Game Completed"
	else:
		$Menu/CenterContainer/VBoxContainer/NextLevelButton.show()
		
	$Menu/CenterContainer/VBoxContainer/ResumeButton.hide()
	$Menu/CenterContainer/VBoxContainer/MainMenuButton.show()
	$Menu/CenterContainer/VBoxContainer/ExitButton.show()
	
