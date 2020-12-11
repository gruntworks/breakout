extends Node

var game_running: bool = true
var game_over: bool = false
var start_countdown: int = 3

func _ready() -> void:
	$Fade.fade_in()
	$Levels.add_child(LOADER.get_level())
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	game_running = false
	$CountdownTimer.start()

func _process(_delta) -> void:
	user_has_won()

func _on_Ball_out_of_screen() -> void:
	game_over = true
	$GameMenu.display_game_over_menu()

func user_has_won() -> void:
	if $Levels.get_child(0).get_child(1).get_child_count() == 0 and game_running:
		game_running = false
		$GameMenu.display_level_cleared_menu()

func to_next_level() -> void:
	#Remove all scenes from levels
	LOADER.level_up()
	for level in $Levels.get_children():
		level.queue_free()
		
	#Load next level and append
	if LOADER.current_level <= LOADER.TOTAL_LEVELS:
		$Levels.add_child(LOADER.get_level())
	else:
		LOADER.current_level = 1
		if get_tree().change_scene("res://scenes/MainMenu.tscn") != OK:
			print("Main Menu scene load failed")
	start_gameplay()
	
func start_gameplay() -> void:
	$Ball.position = Vector2(512, 544)
	$Ball.reset_vector()
	$Player.position = Vector2(512, 568)
	game_over = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$GameMenu.hide_menu()
	$GameMenu/Fade.fade_in()
	yield($GameMenu/Fade/tween, "tween_completed")
	$CountdownTimer.start()
	$CountdownLabel.show()

func _on_CountdownTimer_timeout() -> void:
	if start_countdown != 0:
		$CountdownLabel.text = str(start_countdown)
		start_countdown -= 1
	else:
		$CountdownTimer.stop()
		$CountdownLabel.hide()
		$CountdownLabel.text = "Get Ready"
		start_countdown = 3
		game_running = true
