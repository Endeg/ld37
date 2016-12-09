extends CanvasLayer

func _ready():
	set_process_input(true)
	get_node("StartBlinky/AnimationPlayer").play("Blinkiness")
	
func _input(event):
	if event.type == InputEvent.KEY:
		get_node("StartBlinky/AnimationPlayer").set_speed(5.0)
		get_node("Fade").fadeToBlack("Root.tscn")