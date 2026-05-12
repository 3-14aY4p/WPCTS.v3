class_name ExitPoint extends Area2D


@export_file("*.json") var dialogue_file
@export var locked: bool = true

func _on_body_entered(body: Node2D) -> void:
	if not locked:
		if dialogue_file:
			DialogueManager.activate_box(dialogue_file)
		else:
			body.state_machine.change_state("playerdisabled") 
			GameController.transition_to_next_scene()
	else:
		DialogueManager.activate_box_line("Colin", "mc", "I'm not done here...")
