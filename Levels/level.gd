class_name Level extends Node2D


@onready var camera: CustomCamera = get_tree().get_first_node_in_group("camera")
@onready var player: Player = get_tree().get_first_node_in_group("player")

@onready var objects: Array = get_tree().get_first_node_in_group("object_container").get_children()
@onready var exit_points = get_tree().get_nodes_in_group("exit_point")

@export_file("*.json") var initial_dialogue
@export_enum("box", "popup") var dialogue_bubble = "box"

@export_group("Task Dialogue")
@export_file("*.json") var task_start_dialogue
@export_file("*.json") var task_complete_dialogue
@export_file("*.json") var task_fail_dialogue

@export_group("Node Deletion")
@export var delete_nodes_on_task_started: Array[Node2D]
@export var delete_nodes_on_task_completed: Array[Node2D]
@export var delete_nodes_on_task_failed: Array[Node2D]

func _ready() -> void:
	if player:
		player.state_machine.change_state("playerdisabled")
		
	if not objects: get_tree().get_first_node_in_group("object_container").get_children()
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
		
	if task_start_dialogue:
		DialogueManager.activate_box(task_start_dialogue)
		
	delete_nodes(delete_nodes_on_task_started)

func _on_task_controller_task_completed() -> void:
	task_objects_cleanup()
		
	if task_complete_dialogue:
		DialogueManager.activate_box(task_complete_dialogue)
		GameController.total_tasks_passed += 1
		
	delete_nodes(delete_nodes_on_task_completed)

func _on_task_controller_task_failed() -> void:
	task_objects_cleanup()
			
	if task_fail_dialogue:
		DialogueManager.activate_box(task_fail_dialogue)
		
	delete_nodes(delete_nodes_on_task_failed)

func task_objects_cleanup():
	for exit in exit_points:
		exit.locked = false
		
	objects = get_tree().get_first_node_in_group("object_container").get_children()
	for object: DynamicObject in objects:
		object.set_outline(0)

func delete_nodes(nodes):
	for node in nodes:
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(node, "modulate", Color.TRANSPARENT, .3)
		
		await tween.finished
		node.queue_free()
