extends CanvasLayer

func fade_in() -> void:
	$tween.interpolate_property($TransitionShader.material, "shader_param/cutoff", 0.0, 1.0, 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$tween.start()

func fade_out() -> void:
	$tween.interpolate_property($TransitionShader.material, "shader_param/cutoff", 1.0, 0.0, 0.7, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$tween.start()
