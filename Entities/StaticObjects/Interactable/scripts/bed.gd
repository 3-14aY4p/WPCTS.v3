extends InteractableObject


func _on_interactable_area_interact() -> void:
	super._on_interactable_area_interact()
	
	if GameController.end_of_day:
		DialogueManager.activate_box(dialogue_file)
	else:
		DialogueManager.activate_box_line("Colin", "mc", "I can't sleep yet.")
