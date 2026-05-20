extends CanvasLayer


@export_enum("UI", "QUIZ", "DORM", "CLSR", "CFTR", "LIBR", "BTHR") var soundtrack: String = ""

@export_file("*.json") var dialogue_file
@export_enum("box", "popup") var dialogue_type = "box"

func _ready() -> void:
	if soundtrack != "":
		AudioManager.play_music(soundtrack)
	else:
		AudioManager.stop_music()
	
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

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("_exit"):
		var pause_menu = preload("uid://btabiq1aojweb").instantiate()
		add_child(pause_menu)
