class_name InteractableObject extends StaticBody2D


@onready var player: Player = get_tree().get_first_node_in_group("player")
@onready var interactable_area: InteractableArea = $InteractableArea

@export var action_hint: String = "[E] interact"
@export_file("*.json") var dialogue_file

func _ready() -> void:
	pass

func _on_interactable_area_interact() -> void:
	if dialogue_file:
		DialogueManager.activate_box(dialogue_file)
	else: push_warning("%s is missing a Dialogue File." % [self.name])

func _on_interactable_area_interaction_available():
	pass

func _on_interactable_area_interaction_unavailable() -> void:
	pass
