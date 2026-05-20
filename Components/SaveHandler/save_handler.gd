extends Node
# this is an autoload


const SAVE_PATH: String = "user://save.json"
var save_data := {
	"current_week": 1,
	"current_scene_index": 0,
	"task_completed": [],
	"task_failed": [],
	"weekly_score": []
}

const LB_PATH: String = "user://leaderboard.json"
var lb_data := []

func new_game() -> void:
	GameController.current_week = 1
	GameController.current_scene_index = 0
	GameController.task_completed = []
	GameController.task_failed = []
	GameController.weekly_score = []
	
	GameController.final_score = 0

func save_game() -> void:
	save_data = {
		"current_week": GameController.current_week,
		"current_scene_index": GameController.current_scene_index,
		"task_completed": GameController.task_completed,
		"task_failed": GameController.task_failed,
		"weekly_score": GameController.weekly_score,
	}
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(save_data.duplicate())
	file.close()

func load_game() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var load_data = data.duplicate()
		
		GameController.current_week = load_data.current_week
		GameController.current_scene_index = load_data.current_scene_index
		GameController.task_completed = load_data.task_completed
		GameController.task_failed = load_data.task_failed
		GameController.weekly_score = load_data.weekly_score

# functions for the leaderboard
func sort_leaderboard():
	lb_data.sort_custom(func(a, b):
		return a["final_score"] > b["final_score"]
	)

func add_score(player_name: String, final_score: float):
	var entry := {
		"name": player_name,
		"final_score": final_score
	}
	
	lb_data.append(entry)
	sort_leaderboard()
	
	save_scores()

func save_scores():
	var file = FileAccess.open(LB_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(lb_data))

func load_scores():
	if not FileAccess.file_exists(LB_PATH):
		return
		
	var file = FileAccess.open(LB_PATH, FileAccess.READ)
	var content = file.get_as_text()
	
	var parsed = JSON.parse_string(content)
	if typeof(parsed) == TYPE_ARRAY:
		lb_data = parsed
