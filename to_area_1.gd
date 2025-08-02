extends Area2D

func _on_body_entered(body: Node2D) -> void:
	#get_tree().change_scene_to_file("res://area1.tscn")
	
	Global.next_spawn_point_name = "PositionFromArea2"
	get_tree().change_scene_to_file("res://area1.tscn")
