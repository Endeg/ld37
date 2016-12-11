extends CanvasLayer

var keyPressed = false

func _ready():
	set_process_input(true)
	get_node("StartBlinky/AnimationPlayer").play("Blinkiness")
	#get_node("Fade/BlackScreen/AnimationPlayer").seek(0.0)
	get_node("Fade").fadeOut()
	
func _input(event):
	if event.type == InputEvent.KEY and not keyPressed:
		keyPressed = true
		get_nodo("root/Quest").newGame()
		get_node("StartBlinky/AnimationPlayer").set_speed(5.0)
		get_node("Fade").fadeToBlack("Root.tscn")
