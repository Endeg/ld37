extends CanvasLayer

var nextScene

func fadeToBlack(theNextScene):
	nextScene = theNextScene
	var anim = get_node("BlackScreen/AnimationPlayer")
	anim.play("Fade")
	
func fadeOut():
	var anim = get_node("BlackScreen/AnimationPlayer")
	anim.play_backwards("Fade")
	
func switchToNextScene():
	print("Switching to scene '" + nextScene + "'")
	get_tree().change_scene("res://" + nextScene)