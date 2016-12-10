extends KinematicBody2D

const PLAYER_VEL = 2.0

func _ready():
	set_fixed_process(true)
	print("Player ready!")

func _fixed_process(delta):
	var vel_x = Vector2()
	var vel_y = Vector2()
	if Input.is_action_pressed("player-left"):
		vel_x.x = -PLAYER_VEL
	elif Input.is_action_pressed("player-right"):
		vel_x.x = PLAYER_VEL
	
	if Input.is_action_pressed("player-up"):
		vel_y.y = -PLAYER_VEL
	elif Input.is_action_pressed("player-down"):
		vel_y.y = PLAYER_VEL
	
	move(vel_x)
	move(vel_y)
