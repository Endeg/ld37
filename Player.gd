extends KinematicBody2D

const PLAYER_VEL = 2.0

func _ready():
	set_fixed_process(true)
	print("Player ready!")

func _fixed_process(delta):
	var vel = Vector2()
	if Input.is_action_pressed("player-up"):
		vel.y = -PLAYER_VEL
	elif Input.is_action_pressed("player-down"):
		vel.y = PLAYER_VEL
	
	if Input.is_action_pressed("player-left"):
		vel.x = -PLAYER_VEL
	elif Input.is_action_pressed("player-right"):
		vel.x = PLAYER_VEL
	
	move(vel)
