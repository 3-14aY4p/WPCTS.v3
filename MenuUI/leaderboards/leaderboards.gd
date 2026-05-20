class_name Leaderboard extends Control


@onready var container: VBoxContainer = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer

func _ready() -> void:
	SaveHandler.load_scores()
	
	refresh_ui()
	AudioManager.play_music("UI")

func refresh_ui():
	SaveHandler.sort_leaderboard()
	for c in container.get_children():
		c.queue_free()
		
	for i in range(SaveHandler.lb_data.size()):
		var entry = SaveHandler.lb_data[i]
		
		var row: LeaderboardRow = preload("uid://dm7bb22vrtdo3").instantiate()
		container.add_child(row)
		
		row.rank_label.text = str(i + 1)
		row.name_label.text = entry['name']
		row.score_label.text = "%.1f" % entry["final_score"]

func _on_back_button_pressed() -> void:
	GameController.fade_on_load_scene("uid://ch2mm3rlr513m")
