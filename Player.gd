extends KinematicBody2D

const PLAYER_VEL = 0.75

var sprite

var direction = "Down"

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
		direction = "Left"
	elif Input.is_action_pressed("player-right"):
		vel_x.x = PLAYER_VEL
		moving = true
		direction = "Right"
	if Input.is_action_pressed("player-up"):
		vel_y.y = -PLAYER_VEL
		moving = true
		direction = "Up"
	elif Input.is_action_pressed("player-down"):
		vel_y.y = PLAYER_VEL
		moving = true
		direction = "Down"

	if moving and sprite.get_animation() != "Move" + direction:
		sprite.play("Move" + direction)
	elif not moving and sprite.get_animation().begins_with("Move"):
		sprite.set_animation("Stay" + direction)

	move(vel_x)
	move(vel_y)
