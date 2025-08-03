extends Area2D

func _ready():
	if Global.SquirrelArea2 and Global.currentScene == "res://area2.tscn":
		$AnimatedSprite2D.play()
	elif Global.SquirrelArea3 and Global.currentScene == "res://area3.tscn":
		$AnimatedSprite2D.play()
	else:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	#get_tree().change_scene_to_file("res://area2.tscn")
	if Global.currentScene == "res://area2.tscn":
		Global.SquirrelArea2 = false
	elif Global.currentScene == "res://area3.tscn":
		Global.SquirrelArea3 = false
	Global.next_spawn_point_name = "Squirrel/SquirrelLocation" #current location
	queue_free()
	get_tree().change_scene_to_file("res://RPG.tscn")
