class_name DialoguePopup extends Control


@onready var player: Player = get_tree().get_first_node_in_group("player")

@onready var dialogue_label: RichTextLabel = %DialogueLabel
@onready var indicator: AnimatedSprite2D = %IndicatorSprite

@export_file("*.json") var dialogue_file
var scene_script: Dictionary
var curr_block: Dictionary
var next_block: Dictionary

func _ready() -> void:
	get_tree().paused = true
	
	visible = false
	indicator.hide()
	
	# initialize the script
	if dialogue_file:
		scene_script = get_json(dialogue_file)
		load_block(scene_script["0"])

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("_next_line"):
		next()

# manually load dialogue
func load_dialogue(text: String):
	dialogue_label.text = text
	indicator.show()

# convert json to dictionary
func get_json(src: String):
	var json_text: String = FileAccess.get_file_as_string(src)
	var json_dict: Dictionary = JSON.parse_string(json_text)
	return json_dict


# update GUI
func load_block(block: Dictionary): 
	if block.has("text"): 
		dialogue_label.text = block["text"]

	if block.has("next"):
		indicator.show()
		
		if block["next"] != "":
			var key = block["next"]
			next_block = scene_script[key]
		else:
			next_block = {}
			
	elif block.has("func"):
		indicator.hide()
		
		if block["hide_box"]:
			visible = false
		
		var target_node = get_node(block["node"])
		var func_name = block["func"]
		
		# Since we can't directly put the properties in the
		# json file itself, we can just retrieve them here
		var raw_args = block["args"]		# String values
		var func_args = []
		
		# convert string values to property
		if raw_args:
			for arg in raw_args:
				func_args.append(get(arg))
		
		if target_node.has_method(func_name):
			if func_args.is_empty():
				target_node.call(func_name)
			else:
				target_node.callv(func_name, func_args)
				
		if block["await"]:
			var signal_name = block["await"]
			if target_node.has_signal(signal_name):
				var signal_state = {"done": false} # dict because lambda functions
				var callable = func(_args): signal_state.done = true
				target_node.connect(signal_name, callable, CONNECT_ONE_SHOT)
				while not signal_state.done:
					await get_tree().process_frame
					
		if block["comment"] != "":
			var key = block["comment"]
			next_block = scene_script[key]
		else:
			next_block = {}
		next()
		
	else:
		assert(false, "Err: INVALID BLOCK.")

func next():
	if next_block != {}:
		curr_block = next_block
		load_block(curr_block)
	else:
		get_tree().paused = false
		queue_free()
