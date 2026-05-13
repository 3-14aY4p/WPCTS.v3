extends Node
# this is an autoload


const file_path: String = "user://save.json"
var save_data: Dictionary = {
		"current_day": 1,
		"current_scene_index": 0,
		"total_score": 0,
		"total_task_completed": 0
	}

func new_game() -> void:
	GameController.current_day = 1
	GameController.current_scene_index = 0
	GameController.total_score = 0
	GameController.total_task_completed = 0
	
	GameController.transition_to_next_scene()

func save_game() -> void:
	save_data = {
		"current_day": GameController.current_day,
		"current_scene_index": GameController.current_scene_index,
		"total_score": GameController.total_score,
		"total_task_completed": GameController.total_task_completed
	}
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_var(save_data.duplicate())
	file.close()

func load_game() -> void:
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var loaded_data = data.duplicate()
		GameController.current_day = loaded_data.current_day
		GameController.current_scene_index = loaded_data.current_scene_index
		GameController.total_score = loaded_data.total_score
		GameController.total_task_completed = loaded_data.total_task_completed
		
		GameController.transition_to_next_scene()
