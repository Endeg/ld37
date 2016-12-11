extends Node

var motivation = 2
var gameOver = false

var currentBiome = null
var currentDanger = 0.0

func _init():
	print("Quest object is ready.")

func newGame():
	currentBiome = null
	currentDanger = 0.0
	gameOver = false
	motivation = 2

func updateMotivation():
	var motivationLabel = get_node("/root/Root/FadeableGUI/Motivation")
	assert motivationLabel != null
	motivationLabel.set_text("MT: " + var2str(motivation))

func loseMotivation(amount):
	motivation = motivation - 1
	updateMotivation()

func setBiome(name, theDanger = 0.0):
	currentBiome = name
	currentDanger = theDanger
	var biomeLabel = get_node("/root/Root/FadeableGUI/Biome")
	assert biomeLabel != null
	if name != null:
		biomeLabel.set_text(currentBiome)
	else:
		biomeLabel.set_text("")
