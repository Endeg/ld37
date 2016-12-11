extends Node2D

export var speed = 10

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
	progress.set_value(progress.get_value() + delta * speed)

func reset():
	progress.set_value(progress.get_min())

func isReadyForAction():
	return progress.get_value() >= progress.get_max()

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
		entity.displayDamage() #amount
		#entity.applyDamage(amount)

func displayDamage():
	animation.play("Damage")

func displayAttack():
	animation.play("Attack")


 
