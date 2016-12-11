extends Area2D

var quest = null

func _ready():
	quest = get_node("/root/Quest")

func _on_Biome_body_enter( body ):
	quest.setBiome(get_name())

func _on_Biome_body_exit( body ):
	quest.setBiome(null)
