extends Control


var start_menu_path: String = "uid://beoxcn51v5v5c"

func _on_play_game_pressed() -> void:
	GameController.fade_on_load_scene(start_menu_path)

func _on_leaderboards_pressed() -> void:
	pass # Replace with function body.

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_exit_game_pressed() -> void:
	get_tree().quit()
