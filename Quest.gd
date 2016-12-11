extends Node

var motivation = 2
var gameOver = false

var currentBiome = null

func _init():
	print("Quest object is ready.")

func newGame():
	currentBiome = null
	gameOver = false
	motivation = 2

func updateMotivation():
	var motivationLabel = get_node("/root/Root/FadeableGUI/Motivation")
	assert motivationLabel != null
	motivationLabel.set_text("MT: " + var2str(motivation))

func loseMotivation(amount):
	motivation = motivation - 1
	updateMotivation()

func setBiome(name):
	currentBiome = name
	var biomeLabel = get_node("/root/Root/FadeableGUI/Biome")
	assert biomeLabel != null
	biomeLabel.set_text(currentBiome)
