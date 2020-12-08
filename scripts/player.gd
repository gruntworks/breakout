extends KinematicBody2D

var speed: int
var direction: KinematicCollision2D

func _ready() -> void:
	speed = 600

func _process(delta) -> void:
	if not get_parent().game_over && get_parent().game_running:
		var velocity: Vector2 = Vector2()
		direction = move_and_collide(velocity)
		if Input.is_action_pressed("ui_right"):
			velocity.x += 1
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
		if velocity.length() > 0:
			velocity = velocity * speed

		position += velocity * delta
	
