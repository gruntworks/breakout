extends StaticBody2D

export var audio_on_destroy: AudioStream

func _ready():
	$onDestroyAudio.stream = audio_on_destroy

func destroyItem():
	set_collision_mask_bit(0, false)
	$onDestroyAudio.play()
	if get_node_or_null("Animation"):
		$Animation.play()
		yield($Animation, "animation_finished")
	else:
		$Texture.hide()
		yield($onDestroyAudio, "finished")
		
	queue_free()

