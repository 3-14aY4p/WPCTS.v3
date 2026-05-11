extends Node
# this is a global node


@onready var player: Player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	if not player:
		player = get_tree().get_first_node_in_group("player")

# DIALOGUE BOX
func activate_box(dialogue_file):
	if player:
		player.state_machine.change_state("playerdisabled")
	
	var dialogue_box: DialogueBox = preload("uid://c1g30yjbrt5um").instantiate()
	dialogue_box.dialogue_file = dialogue_file
	
	add_child(dialogue_box)

func activate_box_line(char_name: String, char_anim: String, text: String):
	if player:
		player.state_machine.change_state("playerdisabled")
	
	var dialogue_box: DialogueBox = preload("uid://c1g30yjbrt5um").instantiate()
	add_child(dialogue_box)
	
	dialogue_box.load_dialogue(char_name, char_anim, text)


# DIALOGUE POPUP
func activate_popup(dialogue_file):
	if player:
		player.state_machine.change_state("playerdisabled")
	
	var dialogue_popup: DialoguePopup = preload("uid://bnmud0js0ff3v").instantiate()
	dialogue_popup.dialogue_file = dialogue_file
	
	add_child(dialogue_popup)
	
func activate_popup_line(text: String):
	if player:
		player.state_machine.change_state("playerdisabled")
	
	var dialogue_popup: DialoguePopup = preload("uid://bnmud0js0ff3v").instantiate()
	add_child(dialogue_popup)
	
	dialogue_popup.load_dialogue(text)
