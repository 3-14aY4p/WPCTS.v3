extends Node
# this is an autoload


@onready var transition_handler: CanvasLayer = $TransitionHandler
@onready var animation_player: AnimationPlayer = $TransitionHandler/AnimationPlayer

# for saving progress
var current_day: int = 2
var current_scene_index: int = 9
var total_score: int = 0
var total_tasks_passed: int = 0

const total_tests: int = 4
const total_tasks: int = 5 # [2, 3, 0, 0, 0]


# houses the list of scenes per day
var scene_data: Dictionary = {
	"1": {
		'0': "uid://djlbee5dfgims", # blank 
		'1': "uid://qyb4xoryjck8", # dorm room
		'2': "uid://cfmw7cwkvevs1", # dorm hallway
		'3': "uid://bgg4lmgk586mt", # dorm lobby
		'4': "uid://cg3fhfygs5tmk", # cafeteria
		'5': "uid://pnmxiwj47qni", # blank 
		'6': "uid://db43argg36g4o", # classroom
		'7': "---", # initial assessment
		'8': "uid://cws4d336mldtl", # classroom ()PRE Perry
		'9': "uid://lrey5nrrad7h", # classroom ()POST Perry - chair task
		'10': "uid://pj6lqnqb1tjq", # classroom - heavy box task
		'11': "uid://d1b61hjlmplrr", # classroom dismissal
		'12': "uid://bpywkotjygshj", # dorm room
	},
	"2": {
		'0': "uid://btoibh04mpfbv", # blank screen
		'1': "uid://bhlidls2l4083", # dorm room
		'2': "uid://dglxi3xwixvcw", # dorm hallway help task
		'3': "uid://cptqqy4qhid5i", # classroom
		'4': "---", # First Law assessment
		'5': "uid://cc5k68iydaues", # classroom week 2 demo
		'6': "uid://41tf8o343xgw", # classroom cleanup task
		'7': "uid://dkfy0ry2rpufm", # blank screen
		'8': "uid://cd3rm34d3gcna", # bathroom
		'9': "uid://bnp1inc00da0f", # dorm room
	},
	"3": {
		'0': "uid://djd50uku08326", # blank screen
		'1': "uid://rvib30m0jqdx", # dorm room
		'2': "uid://tc3h7goy7g58", # dorm hallway
		'3': "uid://0203j4k7rht4", # cafeteria
		'4': "", # 
		'5': "", # 
		'6': "", # 
	},
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
	if current_day > scene_data.size():
		display_results()
		return
		
	# player reached the end of the day
	if current_scene_index >= scene_data[str(current_day)].size():
		current_scene_index = 0
		current_day += 1
		
	var curr_scene = scene_data[str(current_day)][str(current_scene_index)]
	if curr_scene == "---":
		current_scene_index += 1
		curr_scene = scene_data[str(current_day)][str(current_scene_index)]
		load_scene(curr_scene)
		current_scene_index += 1
	else:
		load_scene(curr_scene)
		current_scene_index += 1
		
	if current_scene_index == scene_data[str(current_day)].size():
		end_of_day = true

func transition_to_next_scene():
	animation_player.play("fade")
	await animation_player.animation_finished
	load_next_scene()
	animation_player.play_backwards("fade")

func display_results():
	pass

func unlock_exit_points():
	for exit: ExitPoint in get_tree().get_nodes_in_group("exit_point"):
		exit.locked = false

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
