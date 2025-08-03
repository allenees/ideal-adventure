extends CharacterBody2D
signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

var health = 5
@onready var health_label = $"../Health"
var coin_counter = 0
@onready var coin_label = $"../CoinCount"

func _ready():
	screen_size = get_viewport_rect().size
	coin_counter = Global.coin_count
	Global.currentScene = get_tree().current_scene.scene_file_path
	set_coin(coin_counter)
	
		
	#hide()
	
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x < 0:
		$AnimatedSprite2D.animation = "left"
	elif velocity.x > 0:
		$AnimatedSprite2D.animation = "right"
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "down"


func _on_body_entered(body: Node2D) -> void:
		
	Global.next_spawn_point_name = "RPG"
	get_tree().change_scene_to_file("res://RPG.tscn")


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func set_coin(new_coin_count: int) -> void:
	coin_counter = new_coin_count
	coin_label.text = "Coin Count: " + str(coin_counter)
	

func set_health(new_health: int) -> void:
	health = new_health
	health_label.text = "Health: " + str(health)
	Global.player_health = new_health
