extends Node

var coins

func game_over():
	$HUD.show_game_over()
	#pass
	
func start_game():
	new_game()
	
func new_game():
	coins = 0
	$Player.start($StartPosition.position)

func ready():
	#new_game()
	pass
