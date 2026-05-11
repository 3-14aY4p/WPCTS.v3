class_name DialoguePopup extends Control


@onready var player: Player = get_tree().get_first_node_in_group("player")

@onready var dialogue_label: RichTextLabel = %DialogueLabel
@onready var indicator: AnimatedSprite2D = %IndicatorSprite

@export_file("*.json") var dialogue_file
var scene_script: Dictionary
var curr_block: Dictionary
var next_block: Dictionary

func _ready() -> void:
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
		
	else:
		assert(false, "Err: INVALID BLOCK.")

func next():
	if next_block != {}:
		curr_block = next_block
		load_block(curr_block)
	else:
		player.state_machine.change_state("playeridle")
		queue_free()
