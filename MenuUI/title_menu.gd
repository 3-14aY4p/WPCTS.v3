extends Control


func _on_play_game_pressed() -> void:
	GameController.load_scene("uid://beoxcn51v5v5c")

func _on_exit_game_pressed() -> void:
	get_tree().quit()
