extends Node

var game_over = false
var current_level = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOverMenu.get_child(0).hide()
#	print($Levels.get_child(0).get_children()[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Ball_out_of_screen():
	game_over = true
	
func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().paused = true
		$GameOverMenu.display_pause_menu()


func _on_Ball_collided(collider):
	print(collider)
	for item in $Levels.get_child(0).get_children():
#		print(item.get_child(0).get_children())
#		print(collider, item)
		if(item == collider):
			item.queue_free()
