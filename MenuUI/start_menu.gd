extends Control


var title_menu_path: String = "uid://ch2mm3rlr513m"

func _on_new_game_pressed() -> void:
	SaveHandler.new_game()
	GameController.fade_to_next_scene()

func _on_load_game_pressed() -> void:
	# change res:// to user:// on export
	if ResourceLoader.exists("res://save.json"):
		SaveHandler.load_game()
		GameController.fade_to_next_scene()
	else:
		push_warning("Save file does not exist.")

func _on_quiz_mode_pressed() -> void:
	pass # Replace with function body.

func _on_back_pressed() -> void:
	GameController.fade_on_load_scene(title_menu_path)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("_exit"):
		GameController.fade_on_load_scene(title_menu_path)
