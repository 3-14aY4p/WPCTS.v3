extends Node
# this is an autoload


const file_path: String = "user://save.json"
var save_data := {
	"current_week": 1,
	"current_scene_index": 0,
	"task_completed": [],
	"task_failed": [],
	"initial_score": 0,
	"final_score": 0,
	"total_score": 0
}

func new_game() -> void:
	GameController.current_week = 1
	GameController.current_scene_index = 0
	GameController.task_completed = []
	GameController.task_failed = []
	GameController.initial_score = 0
	GameController.final_score = 0
	GameController.total_score = 0

func save_game() -> void:
	save_data = {
		"current_week": GameController.current_week,
		"current_scene_index": GameController.current_scene_index,
		"task_completed": GameController.task_completed,
		"task_failed": GameController.task_failed,
		"initial_score": GameController.initial_score,
		"final_score": GameController.final_score,
		"total_score": GameController.total_score
	}
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_var(save_data.duplicate())
	file.close()

func load_game() -> void:
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var load_data = data.duplicate()
		
		GameController.current_week = load_data.current_week
		GameController.current_scene_index = load_data.current_scene_index
		GameController.task_completed = load_data.task_completed
		GameController.task_failed = load_data.task_failed
		GameController.initial_score = load_data.initial_score
		GameController.final_score = load_data.final_score
		GameController.total_score = load_data.total_score
