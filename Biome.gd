extends Area2D

export var danger = 10.0

var quest = null

func _ready():
	quest = get_node("/root/Quest")

func _on_Biome_body_enter(body):
	print("Biome enter: " + body.get_name() + " - " + get_name())
	quest.setBiome(get_name(), danger)

func _on_Biome_body_exit(body):
	print("Biome exit: " + body.get_name() + " - " + get_name())
	quest.setBiome(null)
