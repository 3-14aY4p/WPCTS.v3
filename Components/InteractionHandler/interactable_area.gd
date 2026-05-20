class_name InteractableArea extends Area2D


signal interaction_available
signal interaction_unavailable
signal interact

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@export var interaction_input: String = "_interact"
@export var action_hint: String = "[E] interact"

func _ready() -> void:
	set_process_unhandled_input(false)
	
	var parent := get_parent()
	if parent is InteractableObject:
		action_hint = parent.action_hint

func _unhandled_input(event: InputEvent) -> void:
	if event.is_echo():
		return
		
	if event.is_action_pressed(interaction_input):
		audio_stream_player.play(0.0)
		if not InteractionHandler.active_areas.is_empty():
			if InteractionHandler.can_interact and InteractionHandler.nearest == self:
				InteractionHandler.can_interact = false
				InteractionHandler.label.hide()
				interact.emit()
				InteractionHandler.can_interact = true

func _on_area_entered(area: Area2D) -> void:
	set_process_unhandled_input(true)
	InteractionHandler.active_areas.push_back(self)
	interaction_available.emit()

func _on_area_exited(area: Area2D) -> void:
	set_process_unhandled_input(false)
	InteractionHandler.active_areas.erase(self)
	interaction_unavailable.emit()
