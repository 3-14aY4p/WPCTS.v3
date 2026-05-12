class_name Level extends Node2D


@onready var camera: CustomCamera = get_tree().get_first_node_in_group("camera")
@onready var player: Player = get_tree().get_first_node_in_group("player")

@onready var objects: Array = get_tree().get_first_node_in_group("object_container").get_children()
@onready var exit_points = get_tree().get_nodes_in_group("exit_point")

@export_file("*.json") var initial_dialogue
@export_file("*.json") var task_start_dialogue
@export_file("*.json") var task_complete_dialogue
@export_file("*.json") var task_fail_dialogue
@export_enum("box", "popup") var dialogue_bubble = "box"
@export var delete_nodes_on_task: Array[Node2D]

func _ready() -> void:
	if player:
		player.state_machine.change_state("playerdisabled")
	
	for object: DynamicObject in objects:
		object.disabled = true
		
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.autostart = false
	timer.start(2)
		
	if initial_dialogue:
		if dialogue_bubble == "box":
			timer.connect("timeout", DialogueManager.activate_box.bind(initial_dialogue))
		else:
			timer.connect("timeout", DialogueManager.activate_popup.bind(initial_dialogue))
			
	await timer.timeout
	timer.queue_free()
	
	if not initial_dialogue:
		player.state_machine.change_state("playeridle")

func _on_task_controller_task_start() -> void:
	for object: DynamicObject in objects:
		object.disabled = false
		
	for node in delete_nodes_on_task:
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(node, "modulate", Color.TRANSPARENT, .3)
		
		await tween.finished
		node.queue_free()
		
	if task_start_dialogue:
		DialogueManager.activate_box(task_start_dialogue)

func _on_task_controller_task_completed() -> void:
	for exit in exit_points:
		exit.locked = false
		
	var task_objects = get_tree().get_nodes_in_group("task_object")
	if not task_objects.is_empty():
		for object: DynamicObject in objects:
			object.set_outline(0)
		
	if task_complete_dialogue:
		DialogueManager.activate_box(task_complete_dialogue)

func _on_task_controller_task_failed() -> void:
	if task_fail_dialogue:
		DialogueManager.activate_box(task_fail_dialogue)
