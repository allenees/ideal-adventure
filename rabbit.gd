extends Area2D

func _ready():
	print(Global.currentScene)
	if Global.RabbitArea1 and Global.currentScene == "res://area1.tscn":
		$AnimatedSprite2D.play()
	elif Global.RabbitArea3 and Global.currentScene == "res://area3.tscn":
		$AnimatedSprite2D.play()
	else:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if Global.currentScene == "res://area1.tscn":
		Global.RabbitArea1 = false
	elif Global.currentScene == "res://area3.tscn":
		Global.RabbitArea3 = false
	Global.next_spawn_point_name = "Rabbit/RabbitLocation" #current location
	queue_free()
	get_tree().change_scene_to_file("res://RPG.tscn")
