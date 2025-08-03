extends Node

@onready var player_node = $Player

func _ready():

	await get_tree().create_timer(2.0).timeout

	Global.coin_count = Global.coin_count + 1
	get_tree().change_scene_to_file(Global.currentScene)
