extends KinematicBody2D

var speed: int
var direction: KinematicCollision2D
var viewport_size: Vector2
var player_size: Vector2
var player_scale: Vector2
var player_y_pos: float

func _ready() -> void:
	speed = 600
	viewport_size = get_viewport().size
	player_size = $Sprite.texture.get_size()
	player_scale = $Sprite.scale
	player_y_pos = $Sprite.global_position.y

func _process(delta) -> void:
	if not get_parent().game_over:
		# ARROW MOVEMENT
#		var velocity: Vector2 = Vector2()
#		direction = move_and_collide(velocity)
#		if Input.is_action_pressed("ui_right"):
#			velocity.x += 1
#		if Input.is_action_pressed("ui_left"):
#			velocity.x -= 1
#		if velocity.length() > 0:
#			velocity = velocity * speed
#		position += velocity * delta
		
		# MOUSE MOVEMENT > only way of the control at the moment...
		position.x = get_viewport().get_mouse_position().x
		if position.x < (player_size.x * player_scale.x) / 2:
			# Set the player to the start of the screen
			position.x = player_size.x * player_scale.x / 2 + 10
		if position.x > viewport_size.x - (player_size.x * player_scale.x) / 2:
			# Set the player to the end of the screen
			position.x = viewport_size.x - (player_size.x * player_scale.x / 2) + 10
		# Keep the Y position always the same
		position.y = player_y_pos
