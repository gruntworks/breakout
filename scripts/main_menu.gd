extends Node

var clouds_offset: Vector2 = Vector2.ZERO
export var cloud_move_multiplier: int = 50

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	clouds_offset = $CloudsNode.position
	_offset_clouds(get_viewport().get_mouse_position()) #Avoid movement glitch

func _input(event) -> void:
	if event is InputEventMouseMotion:
		_offset_clouds(event.position)

func _on_PlayButton_pressed() -> void:
	$Audio/ButtonClick.play()
	yield($Audio/ButtonClick, "finished")
	$FadeIn.show()
	$FadeIn.fade_in()

func _offset_clouds(position: Vector2) -> void:
	clouds_offset.x = - position.x / get_viewport().size.x * cloud_move_multiplier
	clouds_offset.y = - position.y / get_viewport().size.y * cloud_move_multiplier
	$CloudsNode.set_position(clouds_offset)
	$CloudsNode2.set_position(clouds_offset * 2.0)

func _on_FadeIn_fade_finished() -> void:
	if get_tree().change_scene("res://scenes/Main.tscn") != OK:
		print("Main scene load failed")


func _on_Exit_Button_pressed() -> void:
	$Audio/ButtonClick.play()
	yield($Audio/ButtonClick, "finished")
	get_tree().quit()


func _on_PlayButton_mouse_entered() -> void:
	$Audio/ButtonHover.play()


func _on_Exit_Button_mouse_entered() -> void:
	$Audio/ButtonHover.play()


func _on_LevelSelect_pressed() -> void:
	if get_tree().change_scene("res://scenes/LevelSelect.tscn") != OK:
		print("Level Select scene failed to load")
