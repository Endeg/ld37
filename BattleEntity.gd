extends Node2D

var DamageGibClass = preload("res://DamageGib.tscn")

export var speed = 10
export var health = 100
export var baseDamage = 20

var currentHealth = 0

var animation = null
var count = 0

var progress = null

func initEntity(theHealth = 0, theSpeed = 0, theDamage = 0):
	speed = theSpeed
	health = theHealth
	baseDamage = theDamage
	reset()

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
	if isAlive():
		show()
	else:
		hide()

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

func attack(entity):
	if isReadyForAction():
		reset()
		displayAttack()
		var amount = int(baseDamage * rand_range(1.0, 2.0))
		entity.displayDamage(amount)
		entity.applyDamage(amount)

func applyDamage(amount):
	currentHealth = currentHealth - amount
	if currentHealth <= 0:
		currentHealth = 0
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


 
