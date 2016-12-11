extends Node2D

const MAX_TIME_ON_SCREEN = 1

var timeOnScreen = MAX_TIME_ON_SCREEN

func setDamage(theDamage):
	get_node("Label").set_text(var2str(theDamage))

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var vel = Vector2(0, delta * 40)
	set_pos(get_pos() - vel)
	timeOnScreen = timeOnScreen - delta
	
	set_opacity(timeOnScreen / MAX_TIME_ON_SCREEN)
	
	if timeOnScreen < 0:
		queue_free()
