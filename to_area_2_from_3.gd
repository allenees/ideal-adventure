extends Area2D

func _on_body_entered(body: Node2D) -> void:
	#get_tree().change_scene_to_file("res://area2.tscn")
	
	Global.next_spawn_point_name = "PositionFromArea3"
	get_tree().change_scene_to_file("res://area2.tscn")
