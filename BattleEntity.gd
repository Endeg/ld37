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

func displayDamage():
	animation.play("Damage")

func displayAttack():
	animation.play("Attack")
 
