extends Control


@onready var score_label: Label = $MarginContainer/VBoxContainer/ScoreLabel

func _ready() -> void:
	var total_score: int = get_meta("total_score", 0)
	var total_q: int = get_meta("total_q", 10)
	
	GameController.weekly_score.append(total_score)
	score_label.text = "%d out of %d" % [total_score, total_q]

func _on_button_pressed() -> void:
	GameController.fade_to_next_scene()
