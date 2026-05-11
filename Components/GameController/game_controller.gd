extends Node
# this is an autoload


@onready var transition_handler: CanvasLayer = $TransitionHandler
@onready var animation_player: AnimationPlayer = $TransitionHandler/AnimationPlayer

# for saving progress
var current_day: int = 1
var current_scene_index: int = 0
var total_score: int = 0

# houses the list of scenes per day
var scene_data: Dictionary = {
	1: {
		0: "uid://djlbee5dfgims", # blank
		1: "uid://qyb4xoryjck8", # dorm room
		2: "", # 
		3: "", # 
		4: "", # 
		5: "", # 
		6: "", # 
	},
	#2 : {
		#0: "", # 
		#1: "", # 
		#2: "", # 
		#3: "", # 
		#4: "", # 
		#5: "", # 
		#6: "", # 
	#},
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

func _ready() -> void:
	pass

# load next level; dependent on scene_data dictionary
func load_next_scene():
	if current_day > scene_data.size():
		display_results()
		return
	if current_scene_index > scene_data[current_day].size():
		current_scene_index = 0
		return
		
	load_scene(scene_data[current_day][current_scene_index])
	current_scene_index += 1

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
