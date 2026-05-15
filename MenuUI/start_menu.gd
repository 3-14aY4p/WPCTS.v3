extends Control


func _on_new_game_pressed() -> void:
	SaveHandler.new_game()

func _on_load_game_pressed() -> void:
	SaveHandler.load_game()

func _on_quiz_mode_pressed() -> void:
	pass # Replace with function body.

func _on_back_pressed() -> void:
	GameController.load_scene_with_transition("uid://ch2mm3rlr513m")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("_exit"):
		GameController.load_scene_with_transition("uid://ch2mm3rlr513m")
