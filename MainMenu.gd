extends CanvasLayer

func _ready():
	get_node("StartBlinky/AnimationPlayer").play("Blinkiness")