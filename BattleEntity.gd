extends Node2D

var animation = null

func _ready():
	animation = get_node("AnimationPlayer")
	assert animation != null
	
	animation.play("Damage")