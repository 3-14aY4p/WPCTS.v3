class_name InteractableArea extends Area2D


signal interaction_available
signal interaction_unavailable
signal interact

@export var interaction_input: String = "_interact"

func _ready() -> void:
	set_process_unhandled_input(false)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_echo():
		return
		
	if event.is_action_pressed(interaction_input):
		if InteractionHandler.selected:
			if InteractionHandler.can_interact and InteractionHandler.selected == self:
				InteractionHandler.label.hide()
				InteractionHandler.can_interact = false
				interact.emit()
				InteractionHandler.can_interact = true

func _on_area_entered(area: Area2D) -> void:
	if area.name == "PointerArea":
		set_process_unhandled_input(true)
		if InteractionHandler.selected == self:
			InteractionHandler.selected = self
		interaction_available.emit()

func _on_area_exited(area: Area2D) -> void:
	if area.name == "PointerArea":
		set_process_unhandled_input(false)
		if InteractionHandler.selected == self:
			InteractionHandler.selected = null
		interaction_unavailable.emit()
