extends KinematicBody2D

const PLAYER_VEL = 0.75

var sprite = null
var ray = null
var messagePopup = null

var direction = "Down"

var counter = 0

var examinedObject = null

var quest = null

func _ready():
	set_fixed_process(true)
	sprite = get_node("Sprite")
	assert sprite != null
	ray = get_node("Ray")
	assert ray != null
	messagePopup = get_node("/root/Root/GUI/Message")
	assert messagePopup != null
	quest = get_node("/root/Quest")
	assert quest != null
	
	quest.updateMotivation()
	
	messagePopup.showMessages(["Well.", "It's time to turn on computer and check the Internet!"])

func _fixed_process(delta):
	if not quest.gameOver and quest.motivation <= 0:
		quest.gameOver = true
		messagePopup.showMessages(["You lose all your motivation.", "Now all you want is just get some sleep.", "Don't wory you'll finish your projects eventually!"])
		get_node("/root/Root/Fade").fadeToBlack("MainMenu.tscn")
		
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
	var examinedObjectLabel = get_node("/root/Root/FadeableGUI/ExaminedObjectLabel")
	assert examinedObjectLabel != null
	if examinedObject != null:
		examinedObjectLabel.set_text(obj.get_name())
	else:
		examinedObjectLabel.set_text("")


