extends StaticBody2D

export var audio_on_destroy: AudioStream

func _ready() -> void:
	$onDestroyAudio.stream = audio_on_destroy

func destroyItem() -> void:
	set_collision_mask_bit(0, false)
	$onDestroyAudio.play()
	if get_node_or_null("Animation"):
		$Animation.play()
		yield($Animation, "animation_finished")
		$Animation.hide()
		yield($onDestroyAudio,"finished")
	else:
		$Texture.hide()
		yield($onDestroyAudio, "finished")
	queue_free()
