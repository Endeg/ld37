extends Node2D

var DamageGibClass = preload("res://DamageGib.tscn")

export var speed = 10
export var health = 100

var currentHealth = 0

var animation = null
var count = 0

var progress = null

func _ready():
	animation = get_node("AnimationPlayer")
	assert animation != null
	
	progress = get_node("ActionProgress")
	assert progress != null
	reset()
	
	set_fixed_process(true)

func _fixed_process(delta):
	if isAlive():
		progress.set_value(progress.get_value() + delta * speed)

func reset():
	currentHealth = health
	progress.set_value(progress.get_min())
	show()

func isAlive():
	return currentHealth > 0

func isReadyForAction():
	return isAlive() and progress.get_value() >= progress.get_max()

func setEntityName(name = "noname"):
	var lbl = get_node("Label")
	assert lbl != null
	lbl.set_text(name)

	for entity in get_node("Visual").get_children():
		entity.set_hidden(entity.get_name() != name)

func attack(entity, amount = 0):
	if isReadyForAction():
		reset()
		displayAttack()
		entity.displayDamage(amount)
		entity.applyDamage(amount)

func applyDamage(amount):
	health = health - amount
	if health <= 0:
		health = 0
		hide()

func displayDamage(amount):
	animation.play("Damage")
	var dmg = DamageGibClass.instance()
	dmg.setDamage(amount)
	#s.set_pos(get_pos() + vel)
	#s.set_rot(get_rot())
	get_parent().add_child(dmg)

func displayAttack():
	animation.play("Attack")


 
