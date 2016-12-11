extends Node

var motivation = 2
var gameOver = false

func _init():
	print("Quest object is ready.")

func newGame():
	gameOver = false
	motivation = 2

func updateMotivation():
	var motivationLabel = get_node("/root/Root/GUI/Motivation")
	assert motivationLabel != null
	motivationLabel.set_text("MT: " + var2str(motivation))

func loseMotivation(amount):
	motivation = motivation - 1
	updateMotivation()
