extends KinematicBody2D

const PLAYER_VEL = 0.75

var sprite

func _ready():
	set_fixed_process(true)
	sprite = get_node("Sprite")

func _fixed_process(delta):
	var vel_x = Vector2()
	var vel_y = Vector2()
	
	var moving = false
	
	if Input.is_action_pressed("player-left"):
		vel_x.x = -PLAYER_VEL
		moving = true
	elif Input.is_action_pressed("player-right"):
		vel_x.x = PLAYER_VEL
		moving = true
	if Input.is_action_pressed("player-up"):
		vel_y.y = -PLAYER_VEL
		moving = true
	elif Input.is_action_pressed("player-down"):
		vel_y.y = PLAYER_VEL
		moving = true

	if moving and sprite.get_animation().begins_with("Stay"):
		print("Starting animation")
		#sprite.set_animation("MoveDown")
		sprite.play("MoveDown")
	elif not moving and sprite.get_animation().begins_with("Move"):
		print("Staying")
		sprite.set_animation("StayDown")

	move(vel_x)
	move(vel_y)
