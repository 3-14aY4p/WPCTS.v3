extends CanvasLayer


@export_file("*.json") var dialogue_file

func _ready() -> void:
	DialogueManager.activate_box(dialogue_file)
