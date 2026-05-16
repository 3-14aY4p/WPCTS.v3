class_name ExitPoint extends Area2D

@export var character_name: String = "Colin"
@export_enum(
	"mc", "dm", "mt", "pf", "rand", "unkn"
) var character_anim = "mc"
@export_multiline() var dialogue_line: String = "I'm not done here..."

@export_file("*.json") var dialogue_file
@export var locked: bool = true

func _on_body_entered(body: Node2D) -> void:
	if not locked:
		if dialogue_file:
			DialogueManager.activate_box(dialogue_file)
		else:
			body.state_machine.change_state("playerdisabled") 
			GameController.fade_to_next_scene()
	else:
		DialogueManager.activate_box_line(character_name, character_anim, dialogue_line)
