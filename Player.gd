extends KinematicBody2D

const PLAYER_VEL = 0.75

var sprite

var ray = null

var direction = "Down"

var counter = 0

var examinedObject = null

func _ready():
	set_fixed_process(true)
	sprite = get_node("Sprite")
	assert sprite != null
	ray = get_node("Ray")
	assert ray != null

func _fixed_process(delta):
	var vel_x = Vector2()
	var vel_y = Vector2()
	
	var moving = false
	
	if Input.is_action_pressed("player-left"):
		vel_x.x = -PLAYER_VEL
		moving = true
		ray.set_rot(deg2rad(270.0))
		direction = "Left"
	elif Input.is_action_pressed("player-right"):
		vel_x.x = PLAYER_VEL
		moving = true
		ray.set_rot(deg2rad(90.0))
		direction = "Right"
	if Input.is_action_pressed("player-up"):
		vel_y.y = -PLAYER_VEL
		moving = true
		ray.set_rot(deg2rad(180.0))
		direction = "Up"
	elif Input.is_action_pressed("player-down"):
		vel_y.y = PLAYER_VEL
		moving = true
		ray.set_rot(deg2rad(0.0))
		direction = "Down"

	if moving and sprite.get_animation() != "Move" + direction:
		sprite.play("Move" + direction)
	elif not moving and sprite.get_animation().begins_with("Move"):
		sprite.set_animation("Stay" + direction)

	move(vel_x)
	move(vel_y)

func set_examined_object(obj):
	examinedObject = obj
	var examinedObjectLabel = get_node("/root/Root/GUI/ExaminedObjectLabel")
	assert examinedObjectLabel != null
	if examinedObject != null:
		examinedObjectLabel.set_text(obj.get_name())
	else:
		examinedObjectLabel.set_text("")


