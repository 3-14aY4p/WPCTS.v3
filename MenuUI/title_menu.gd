extends Control


func _on_play_game_pressed() -> void:
	# change to showing a menu with the following choices
	# - new game
	# - load game
	# - quiz game
	# - leaderboards
	
	GameController.transition_to_next_scene()

func _on_exit_game_pressed() -> void:
	get_tree().quit()
