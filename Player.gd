extends KinematicBody2D

var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 600

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	move_and_collide(velocity)
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity * speed

	position += velocity * delta
