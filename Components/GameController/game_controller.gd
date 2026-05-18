extends Node
# this is an autoload


@onready var transition_handler: CanvasLayer = $TransitionHandler
@onready var animation_player: AnimationPlayer = $TransitionHandler/AnimationPlayer

# SAVE VARIABLES
var current_week: int = 1
var current_scene_index: int = 0
# ---
var task_completed: Array = []
var task_failed: Array = []
var task_points: float = 0
# ---
var weekly_score: Array[int] = []
# ---

# houses the list of scenes per day
var scene_data: Dictionary = {
	1: {
		0: "uid://ohebakx3iuxd",
		1: "uid://c83fq8xypv83j",	# dorm room
		2: "uid://c088a6oelxkjm",	# dorm hallway
		3: "uid://xpr6vr8kf3y7",	# cafeteria
		4: "uid://ib73g6g2kyjb",	# classroom
		5: "",	# assessment
		6: "uid://bsnkpc0bsdxs5",	# classroom
		7: "uid://d0h7rrufyampu", 	# classroom
		8: "uid://e64rtobwbf6n", 	# dorm room
	},
	2: {
		0: "uid://b5og3whrcafos",
		1: "uid://ck3fdh1eo2y7x",	# dorm room
		2: "uid://3cgxv5supjcu",	# dorm hallway
		3: "uid://vl35s160bwen",	# dorm lobby
		4: "uid://c7g566bi0jrsn",	# classroom
		5: "",	# assessment
		6: "uid://bgo4chu11mvpl",	# classroom
		7: "uid://t76u0pwrytqd",	# classroom
		8: "uid://cstvspqyvvil2",	# library
		9: "uid://bmrir1f6vkvo2",	# library
		10: "uid://derdp5wh82xma",	# dorm room
	},
	3: {
		0: "uid://el4o3xwgsscf",
		1: "uid://bm5fvq8ow8c4p",
	},
	4: {
		0: "", 
	},
	5: {
		0: "", 
	},
}
var current_scene: String
var end_of_week: bool = false

var current_task: TaskController
var current_level: GameLevel

func _physics_process(delta: float) -> void:
	if not current_task:
		current_task = get_tree().get_first_node_in_group("task_controller")
		
	if not current_level:
		current_level = get_tree().get_first_node_in_group("game_level")

# to make starting tasks from dialogue easier
func start_level_task():
	if current_task:
		current_task._start_task()

# for when game finally ends (idk what to put in here yet)
func display_final_results():
	pass

func save_and_next():
	SaveHandler.save_game()
	fade_to_next_scene()


# load next level; dependent on scene_data dictionary
func load_next_scene():
	# player reached the end of the game
	if current_week > scene_data.size():
		display_final_results()
		return
		
	# player reached the end of the week
	if current_scene_index >= scene_data[current_week].size():
		current_week += 1
		current_scene_index = 0
		
	var current_scene_path = scene_data[current_week][current_scene_index]
	if current_scene_path != "":
		load_scene(current_scene_path)
	else:
		current_scene_index += 1
		load_next_scene()
		return
	
	current_scene_index += 1
	
	if current_scene_index == scene_data[current_week].size():
		end_of_week = true
	else: end_of_week = false

# changing scenes with transition effects
func fade_to_next_scene():
	animation_player.play("fade")
	await animation_player.animation_finished
	load_next_scene()
	animation_player.play_backwards("fade")

func fade_on_load_scene(scene_path: String):
	animation_player.play("fade")
	await animation_player.animation_finished
	load_scene(scene_path)
	animation_player.play_backwards("fade")


# reload the current scene to its original state
func restart_scene():
	get_tree().reload_current_scene()

# replace current scene with another
func load_scene(scene_path: String):
	current_scene = scene_path
	get_tree().change_scene_to_file(scene_path)
