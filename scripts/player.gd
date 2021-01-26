extends KinematicBody2D

var speed: int
var direction: KinematicCollision2D

var player_size: Vector2
var player_scale: Vector2
var player_y_pos: float

var player_start_limit: float
var player_end_limit: float

#JUMPING VARIABLES

const GRAVITY = 1000
const JUMP_FORCE = 500
var speed_y: float = 0
var is_jumping: bool = false

func _ready() -> void:
	speed = 600
	player_size = $Sprite.texture.get_size()
	player_scale = $Sprite.scale
	player_y_pos = $Sprite.global_position.y
	
	player_start_limit = player_size.x * player_scale.x / 2
	player_end_limit =  get_viewport_rect().size.x - player_size.x * player_scale.x / 2

func _physics_process(delta) -> void:
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
		
		#JUMPING	
		
		if is_jumping:
			position.y += speed_y * delta
			speed_y += GRAVITY * delta

		# Bottom Y limit for the player
			if position.y >= player_y_pos:
				position.y = player_y_pos
				is_jumping = false


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and not is_jumping:
			speed_y = -JUMP_FORCE
			is_jumping = true
			
			
			
			
			
			
			
