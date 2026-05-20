extends CanvasLayer


func _ready() -> void:
	get_tree().paused = true
	visible = true

func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	queue_free()

func _on_exit_button_pressed() -> void:
	get_tree().paused = false
	AudioManager.play_music("UI")
	for child in DialogueManager.get_children():
		child.queue_free()
	GameController.fade_on_load_scene("uid://ch2mm3rlr513m")
	queue_free()
