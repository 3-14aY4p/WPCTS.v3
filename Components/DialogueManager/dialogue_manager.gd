extends Node
# this is a global node

@onready var player: Player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	if not player:
		player = get_tree().get_first_node_in_group("player")

# DIALOGUE BOX
func activate_dialogue(dialogue_file):
	player.state_machine.change_state("playerdisabled")
	
	var dialogue_box: DialogueBox = preload("uid://c1g30yjbrt5um").instantiate()
	dialogue_box.dialogue_file = dialogue_file
	
	add_child(dialogue_box)

func activate_line(char_name: String, char_anim: String, text: String):
	player.state_machine.change_state("playerdisabled")
	
	var dialogue_box: DialogueBox = preload("uid://c1g30yjbrt5um").instantiate()
	add_child(dialogue_box)
	
	dialogue_box.load_dialogue(char_name, char_anim, text)

# TUTORIAL/HINT BOX
