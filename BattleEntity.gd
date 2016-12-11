extends Node2D

var animation = null
var count = 0

func _ready():
	animation = get_node("AnimationPlayer")
	assert animation != null
	
	#animation.play("Damage")

func setEntityName(name = "noname"):
	var lbl = get_node("Label")
	assert lbl != null
	lbl.set_text(name)

	for entity in get_node("Visual").get_children():
		entity.set_hidden(entity.get_name() != name)

func displayDamage():
	animation.play("Damage")

func displayAttack():
	animation.play("Attack")
 
