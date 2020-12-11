extends KinematicBody2D

var speed: int
var direction: KinematicCollision2D

var player_size: Vector2
var player_scale: Vector2
var player_y_pos: float

var player_start_limit: float
var player_end_limit: float

func _ready() -> void:
	speed = 600
	player_size = $Sprite.texture.get_size()
	player_scale = $Sprite.scale
	player_y_pos = $Sprite.global_position.y
	
	player_start_limit = player_size.x * player_scale.x / 2 + 10
	player_end_limit =  get_viewport_rect().size.x - player_size.x * player_scale.x / 2 + 10

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
		
		# MOUSE MOVEMENT -> only way of the player control at the moment...
		position.x = get_viewport().get_mouse_position().x
#		# Dont allow player to exit the screen on x axis
		position.x = clamp(position.x, player_start_limit, player_end_limit)
		# Keep the Y position always the same
		position.y = player_y_pos

