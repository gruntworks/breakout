extends CanvasLayer

func fade_in() -> void:
	yield(get_tree().create_timer(0.3), "timeout")
	$tween.interpolate_property($TransitionShader.material, "shader_param/cutoff", 0.0, 1.0, 0.8, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$tween.start()

func fade_out() -> void:
	$tween.interpolate_property($TransitionShader.material, "shader_param/cutoff", 1.0, 0.0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$tween.start()
