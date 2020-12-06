extends KinematicBody2D

var direction: Vector2 = Vector2.ZERO
signal out_of_screen
export var speed: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(-200, 300) * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!get_parent().game_over and get_parent().game_running ):
		var collision = move_and_collide(direction * delta)

		if collision:
#			var reflect = collision.remainder.bounce(collision.normal)
			direction = direction.bounce(collision.normal)
#			move_and_collide(reflect)
			if(collision.collider.name == "Walls" || collision.collider.name == "Player"):
				$BallHitAudio.play()
			if(collision and collision.collider.has_method("destroyItem")):
				collision.collider.destroyItem()
			
func reset_vector():
	direction = Vector2(-200, 300) * speed
	
func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("out_of_screen")
