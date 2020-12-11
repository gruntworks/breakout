extends Control

func _ready() -> void:
	$Fade.fade_in()
	for level in get_tree().get_nodes_in_group("level_select"):
		level.connect("mouse_entered", self, "_on_level_bubble_hover", [level])
		level.connect("pressed", self, "_on_level_bubble_click", [level])

func _on_level_bubble_click(level: TextureButton) -> void:
	LOADER.current_level = int(level.name)
	$Audio/ButtonClickAudio.play()
	yield($Audio/ButtonClickAudio, "finished")
	$Fade.fade_out()
	yield($Fade/tween, "tween_completed")
	
	if get_tree().change_scene("res://scenes/Main.tscn") != OK:
		print("Main scene load failed")

func _on_level_bubble_hover(_level: TextureButton) -> void:
	$Audio/ButtonHoverAudio.play()

func _on_BackButton_pressed() -> void:
	$Audio/ButtonClickAudio.play()
	yield($Audio/ButtonClickAudio, "finished")
	if get_tree().change_scene("res://scenes/MainMenu.tscn") != OK:
		print("Main Menu scene load failed")


func _on_BackButton_mouse_entered() -> void:
	$Audio/ButtonHoverAudio.play()
