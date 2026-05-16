class_name DisposableUI extends Control


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_type() and visible:
		queue_free()
