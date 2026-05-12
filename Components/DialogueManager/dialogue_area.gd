class_name DialogueArea extends InteractableArea


@export_file("*.json") var dialogue_file
@export_enum("box", "popup") var dialogue_bubble = "box"
@export_enum("touch", 		## dialogue triggers upon player touching the area
			"talk"			## dialogue triggers upon player interaction
		) 
var interact_mode = "touch"

func _ready() -> void:
	if interact_mode == "touch":
		set_collision_mask_value(4, true)
	else:
		set_collision_mask_value(5, true)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and dialogue_file:
		if dialogue_bubble == "box":
			DialogueManager.activate_box(dialogue_file)
		else:
			DialogueManager.activate_popup(dialogue_file)
		queue_free()

func _on_interact() -> void:
	if dialogue_file:
		if dialogue_bubble == "box":
			DialogueManager.activate_box(dialogue_file)
		else:
			DialogueManager.activate_popup(dialogue_file)
		queue_free()
