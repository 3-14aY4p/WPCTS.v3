class_name NamePrompt extends Control


@onready var line_edit: LineEdit = $NinePatchRect/MarginContainer/VBoxContainer/LineEdit

func _on_submit_button_pressed() -> void:
	SaveHandler.add_score(line_edit.text, GameController.final_score)
	GameController.fade_on_load_scene("uid://bsewjhvw4x7ih")
