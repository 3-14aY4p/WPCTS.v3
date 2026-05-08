extends Node
# this is an autoload

# for saving progress
var current_day: int = 0 # starts at demos
var current_scene_index: int = 0
var total_score: int = 0

# houses the list of scenes per day
var scene_data: Dictionary = {
	0: {
		0: "uid://ddhar5ehgr4m1", # DEMO_Shove_0
		1: "uid://dpfckcwljdleq", # DEMO_Delivery_0
		2: "uid://juk6mt0v8why", # DEMO_Shove_1
		3: "uid://bmywuxv5nek85", # DEMO_Delivery_1
	},
	#1: {
		#
	#},
	#2: {
		#
	#},
	#3: {
		#
	#},
	#4: {
		#
	#},
	#5: {
		#
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
