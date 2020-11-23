extends KinematicBody2D

var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(-200, -300)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(direction * delta)
	
	if collision:
		var reflect = collision.remainder.bounce(collision.normal)
		direction = direction.bounce(collision.normal)
		move_and_collide(reflect)

