extends Node
# this is an autoload


@onready var transition_handler: CanvasLayer = $TransitionHandler
@onready var animation_player: AnimationPlayer = $TransitionHandler/AnimationPlayer

# for saving progress
var current_day: int = 1
var current_scene_index: int = 11
var tasks_failed: int = 0
var total_credit: int = 0

# houses the list of scenes per day
var scene_data: Dictionary = {
	1: {
		0: "uid://djlbee5dfgims", # blank screen
		1: "uid://qyb4xoryjck8", # dorm room
		2: "uid://cfmw7cwkvevs1", # dorm hallway
		3: "uid://bgg4lmgk586mt", # dorm lobby
		4: "uid://cg3fhfygs5tmk", # cafeteria
		5: "uid://pnmxiwj47qni", # blank screen
		6: "uid://db43argg36g4o", # classroom
		7: "---", # initial assessment
		8: "uid://cws4d336mldtl", # classroom ()PRE Perry
		9: "uid://lrey5nrrad7h", # classroom ()POST Perry
		10: "uid://pj6lqnqb1tjq",
		11: "uid://d1b61hjlmplrr",
		12: "uid://bpywkotjygshj", # dorm
	},
	2 : {
		0: "", # 
		1: "", # 
		2: "", # 
		3: "", # 
		4: "", # 
		5: "", # 
		6: "", # 
	},
	#: {
		#0: "", # 
		#1: "", # 
		#2: "", # 
		#3: "", # 
		#4: "", # 
		#5: "", # 
		#6: "", # 
	#},
}
var current_scene: String
var task_controller: TaskController
var end_of_day: bool = false

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if not task_controller:
		task_controller = get_tree().get_first_node_in_group("task_controller")

func start_next_task():
	if task_controller:
		task_controller.start_task()

# load next level; dependent on scene_data dictionary
func load_next_scene():
	# player reached the end of the game
	if current_day >= scene_data.size():
		display_results()
		return
	# player reached the end of the day
	if current_scene_index >= scene_data[current_day].size():
		current_day += 1
		current_scene_index = 0
		load_next_scene()
		
	var curr_scene = scene_data[current_day][current_scene_index]
	if curr_scene == "---":
		current_scene_index += 1
		load_next_scene()
	else:
		load_scene(curr_scene)
		current_scene_index += 1
		
	if current_scene_index == scene_data[current_day].size():
		end_of_day = true

func transition_to_next_scene():
	animation_player.play("fade")
	await animation_player.animation_finished
	load_next_scene()
	animation_player.play_backwards("fade")

func display_results():
	pass


func restart_scene():
	get_tree().reload_current_scene()

# replace current scene with another
func load_scene(scene_path: String):
	current_scene = scene_path
	get_tree().change_scene_to_file(scene_path)

# convert json to dictionary
func get_json(src: String):
	var json_text: String = FileAccess.get_file_as_string(src)
	var json_dict: Dictionary = JSON.parse_string(json_text)
	return json_dict
