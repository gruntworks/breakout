extends Node

var game_over: bool = false
var level_cleared: bool = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Levels.add_child(LOADER.get_level())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	user_has_won()

func _on_Ball_out_of_screen():
	game_over = true
	$GameMenu.display_game_over_menu()

func user_has_won():
	if $Levels.get_child(0).get_child(1).get_child_count() == 0 and !level_cleared:
		level_cleared = true
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
		get_tree().change_scene("res://scenes/MainMenu.tscn")
	start_gameplay()
	
func start_gameplay():
	$Ball.position = Vector2(512, 544)
	$Ball.reset_vector()
	$Player.position = Vector2(512, 568)
	game_over = false
	level_cleared = false
	$GameMenu.hide_menu()
