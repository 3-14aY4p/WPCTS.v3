class_name DialogueObject extends InteractableObject


@export var character_name: String = "Colin"
@export_enum(
	"mc", "dm", "mt", "pf", "rand", "unkn"
) var character_anim = "mc"
@export_multiline() var dialogue_line: String

func _on_interactable_area_interact() -> void:
	super._on_interactable_area_interact()
	
	if dialogue_file:
		DialogueManager.activate_box(dialogue_file)
	else:
		DialogueManager.activate_box_line(character_name, character_anim, dialogue_line)
