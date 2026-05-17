class_name DialogueArea extends InteractableArea


@export var character_name: String = "Colin"
@export_enum(
	"mc", "dm", "mt", "pf", "rand", "unkn"
) var character_anim = "mc"
@export_multiline() var dialogue_line: String

@export_file("*.json") var dialogue_file
@export_enum("box", "popup") var dialogue_bubble = "box"
@export_enum("touch", 				## dialogue triggers upon player touching the area
			"talk"					## dialogue triggers upon player interaction
) var interact_mode = "touch"
@export var oneshot: bool = true	## delete after triggering

func _ready() -> void:
	if interact_mode == "touch":
		set_collision_mask_value(4, true)
	else:
		set_collision_mask_value(5, true)

func trigger_dialogue():
	if dialogue_file:
		if dialogue_bubble == "box":
			DialogueManager.activate_box(dialogue_file)
		else:
			DialogueManager.activate_popup(dialogue_file)
	else:
		DialogueManager.activate_box_line(character_name, character_anim, dialogue_line)
		
	if oneshot:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	trigger_dialogue()

func _on_interact() -> void:
	trigger_dialogue()
