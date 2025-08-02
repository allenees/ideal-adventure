extends Node

@onready var player_node = $Player

func _ready():
	if Global.next_spawn_point_name != "":
		var spawn_point = get_node(Global.next_spawn_point_name)
		if spawn_point:
			player_node.position = spawn_point.global_position
		Global.next_spawn_point_name = ""
