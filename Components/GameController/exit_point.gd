class_name ExitPoint extends InteractableArea


@export_file("*.json") var dialogue_file
@export var locked: bool = true

func _on_interact() -> void:
	if not locked:
		DialogueManager.activate_dialogue(dialogue_file)
	else:
		DialogueManager.activate_line("Colin", "mc", "I'm not done here.")
