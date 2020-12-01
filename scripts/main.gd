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
		print('HERE')
		$GameMenu.display_level_cleared_menu()

func to_next_level():
	#Remove all scenes from levels
	LOADER.level_up()
	for level in $Levels.get_children():
		$Levels.remove_child(level)
		level.free()
	#Load next level and append
	$Levels.add_child(LOADER.get_level())
	start_gameplay()

	
#func get_level(level_number: int):
#	var level: PackedScene = load("res://levels/level_" + str(level_number) + ".tscn")
#	return(level.instance());
	
func start_gameplay():
	$Ball.position = Vector2(512, 544)
	game_over = false
	level_cleared = false
	$GameMenu.hide_menu()
