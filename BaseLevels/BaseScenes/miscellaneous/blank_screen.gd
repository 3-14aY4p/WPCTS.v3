extends CanvasLayer


@export_file("*.json") var dialogue_file
@export_enum("box", "popup") var dialogue_type = "box"

func _ready() -> void:
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.autostart = false
	timer.start(2)
	
	if dialogue_type == "box":
		timer.connect("timeout", DialogueManager.activate_box.bind(dialogue_file))
	else:
		timer.connect("timeout", DialogueManager.activate_popup.bind(dialogue_file))
		
	await timer.timeout
	timer.queue_free()
