extends Node

var game_running: bool = true
var game_over: bool = false
var start_countdown: int = 3

func _ready():
	$Levels.add_child(LOADER.get_level())
	game_running = false
	$CountdownTimer.start()

func _process(delta):
	user_has_won()

func _on_Ball_out_of_screen():
	game_over = true
	$GameMenu.display_game_over_menu()

func user_has_won():
	if $Levels.get_child(0).get_child(1).get_child_count() == 0 and game_running:
		game_running = false
		$GameMenu.display_level_cleared_menu()

func to_next_level():
	#Remove all scenes from levels
	LOADER.level_up()
	for level in $Levels.get_children():
		$Levels.remove_child(level)
		level.free()
		
	#Load next level and append
	if LOADER.get_level() != null:
		$Levels.add_child(LOADER.get_level())
	else:
		LOADER.current_level = 1
		get_tree().change_scene("res://scenes/MainMenu.tscn")
	start_gameplay()
	
func start_gameplay():
	$Ball.position = Vector2(512, 544)
	$Ball.reset_vector()
	$Player.position = Vector2(512, 568)
	game_over = false
	$CountdownTimer.start()
	$GameMenu.hide_menu()
	$CountdownLabel.show()

func _on_CountdownTimer_timeout():
	if start_countdown != 0:
		$CountdownLabel.text = str(start_countdown)
		$Audio/Countdown.play()
		start_countdown -= 1
	else:
		$CountdownTimer.stop()
		$CountdownLabel.hide()
		$CountdownLabel.text = "Get Ready"
		start_countdown = 3
		game_running = true
