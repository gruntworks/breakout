extends Node

#var fade_finished = false
var clouds_offset: Vector2 = Vector2.ZERO
export var cloud_move_multiplier: int = 50

func _ready():
	clouds_offset = $CloudsNode.position

func _input(event):
	if event is InputEventMouseMotion:
		clouds_offset.x = - event.position.x / get_viewport().size.x * cloud_move_multiplier
		clouds_offset.y = - event.position.y / get_viewport().size.y * cloud_move_multiplier
		$CloudsNode.set_position(clouds_offset)
		$CloudsNode2.set_position(clouds_offset * 2.0)

func _on_PlayButton_pressed() -> void:
	$Audio/ButtonClick.play()
	yield($Audio/ButtonClick, "finished")
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished() -> void:
	get_tree().change_scene("res://scenes/Main.tscn");


func _on_Exit_Button_pressed() -> void:
	$Audio/ButtonClick.play()
	yield($Audio/ButtonClick, "finished")
	get_tree().quit()


func _on_PlayButton_mouse_entered() -> void:
	$Audio/ButtonHover.play()


func _on_Exit_Button_mouse_entered() -> void:
	$Audio/ButtonHover.play()
