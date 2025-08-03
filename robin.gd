extends Area2D

func _ready():
	if Global.RobinArea2:
		$AnimatedSprite2D.play()
	else:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	#get_tree().change_scene_to_file("res://area2.tscn")
	Global.RobinArea2 = false
	Global.next_spawn_point_name = "Robin/RobinLocation" #current location
	queue_free()
	get_tree().change_scene_to_file("res://RPG.tscn")
