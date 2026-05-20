extends Control


@onready var initial_ass_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/InitialAssLabel
@onready var final_ass_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/FinalAssLabel
@onready var task_comp_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/TaskCompLabel
@onready var pract_rating_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/PractRatingLabel
@onready var final_grade_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/FinalGradeLabel

func _ready() -> void:
	AudioManager.play_music("UI")
	
	initial_ass_label.text = str(GameController.weekly_score[0])
	final_ass_label.text = str(GameController.weekly_score[4])
	task_comp_label.text = "%d/11" % GameController.task_completed.size()
	
	var player_score: float = 0
	for score: int in GameController.weekly_score:
		player_score += score
	GameController.final_score = 60 + (player_score / 40.0) * 25
	
	if GameController.final_score >= 75:
		pract_rating_label.text = "Pass"
	else: pract_rating_label.text = "Fail"
	
	final_grade_label.text = "%.1f" % GameController.final_score

func _on_next_button_pressed() -> void:
	var name_prompt: NamePrompt = preload("uid://45tf4ipqytbv").instantiate()
	add_child(name_prompt)
