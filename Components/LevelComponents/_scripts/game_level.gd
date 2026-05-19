class_name GameLevel extends Node2D


@onready var camera: CustomCamera = get_tree().get_first_node_in_group("camera")
@onready var task_controller: TaskController = $TaskController

@onready var player: Player = get_tree().get_first_node_in_group("player")
@onready var exit_points: Array = get_tree().get_nodes_in_group("exit_point")
@onready var objects: Array = get_tree().get_nodes_in_group("dynamic_object")

@export var initial_camera_focus: Node2D = null
@export_range(0.0, 100.0, 0.5) var wait_time: float = 2

@export_file("*.json") var onready_dialogue
@export_enum("box", "popup") var onready_dialogue_type = "box"
@export_file("*.json") var oninput_dialogue
@export_enum("box", "popup") var oninput_dialogue_type = "box"

@export_group("Task Variables")
@export_subgroup("Dialogue")
@export_enum("box", "popup") var on_start_dialogue_type = "box"
@export_file("*.json") var on_start_dialogue
@export_enum("box", "popup") var on_complete_dialogue_type = "box"
@export_file("*.json") var on_complete_dialogue
@export_enum("box", "popup") var on_fail_dialogue_type = "box"
@export_file("*.json") var on_fail_dialogue

@export_subgroup("Delete Nodes")
@export var free_on_start: Array[Node2D]
@export var free_on_complete: Array[Node2D]
@export var free_on_fail: Array[Node2D]

@export_subgroup("Instatiate Nodes")
@export var points_on_start: Array[Marker2D]
@export var points_on_complete: Array[Marker2D]
@export var points_on_fail: Array[Marker2D]

@export var instantiate_on_start: Array[PackedScene]
@export var instantiate_on_complete: Array[PackedScene]
@export var instantiate_on_fail: Array[PackedScene]

func _ready() -> void:
	if player:
		player.state_machine.change_state("playerdisabled")
		
	if initial_camera_focus == null:
		camera.target = player
	else: camera.target = initial_camera_focus
		
	for object: DynamicObject in objects:
		object.disabled = true
		
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.autostart = false
	timer.start(wait_time)

	if onready_dialogue:
		if onready_dialogue_type == "box":
			timer.connect("timeout", DialogueManager.activate_box.bind(onready_dialogue))
		else: timer.connect("timeout", DialogueManager.activate_popup.bind(onready_dialogue))
		
	await timer.timeout
	timer.queue_free()
	
	if not onready_dialogue:
		player.state_machine.change_state("playeridle")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_type() and oninput_dialogue:
		if oninput_dialogue_type == "box":
			DialogueManager.activate_box(oninput_dialogue)
		else: DialogueManager.activate_popup(oninput_dialogue)
		
		oninput_dialogue = null

func _physics_process(delta: float) -> void:
	if not player:
		player = get_tree().get_first_node_in_group("player")
	objects = get_tree().get_nodes_in_group("dynamic_object")

func _on_task_controller_task_start() -> void:
	for object: DynamicObject in objects:
		object.disabled = false
		if object.is_in_group("task_object"):
			object.set_outline(1)
		
	if on_start_dialogue:
		if on_start_dialogue_type == "box":
			DialogueManager.activate_box(on_start_dialogue)
		else: DialogueManager.activate_popup(on_start_dialogue)
		
	if free_on_start: delete_nodes(free_on_start)
	if instantiate_on_start and points_on_start:
		instantiate_nodes(instantiate_on_start, points_on_start)

func _on_task_controller_task_complete() -> void:
	post_task_cleanup()
		
	if free_on_complete: delete_nodes(free_on_complete)
	if instantiate_on_complete and points_on_complete:
		instantiate_nodes(instantiate_on_complete, points_on_complete)
		
	GameController.task_completed.append(task_controller.task_id)
	
	if on_complete_dialogue:
		if on_complete_dialogue_type == "box":
			DialogueManager.activate_box(on_complete_dialogue)
		else: DialogueManager.activate_popup(on_complete_dialogue)
	#else: GameController.fade_to_next_scene()

func _on_task_controller_task_fail() -> void:
	post_task_cleanup()
		
	if free_on_fail: delete_nodes(free_on_fail)
	if instantiate_on_fail and points_on_fail:
		instantiate_nodes(instantiate_on_fail, points_on_fail)
		
	GameController.task_failed.append(task_controller.task_id)
	
	if on_fail_dialogue:
		if on_fail_dialogue_type == "box":
			DialogueManager.activate_box(on_fail_dialogue)
		else: DialogueManager.activate_popup(on_fail_dialogue)
	#else: GameController.fade_to_next_scene()

func delete_nodes(nodes: Array[Node2D], tweener: bool = true):
	var tween: Tween = get_tree().create_tween()
	if not nodes.is_empty():
		for node in nodes:
			if tweener:
				tween.tween_property(node, "modulate:a", 0.0, 0.5)
				await tween.finished
			node.queue_free()

func instantiate_nodes(nodes: Array[PackedScene], spawnpoints: Array[Marker2D]):
	var tween: Tween = get_tree().create_tween()
	for point in spawnpoints:
		for node in nodes:
			var instance = node.instantiate()
			instance.modulate.a = 0.0
			point.add_child(instance)
			instance.global_position = point.global_position
			
			tween.tween_property(instance, "modulate:a", 1.0, 0.5)

func post_task_cleanup():
	for exit in exit_points:
		exit.locked = false
		
	for object: DynamicObject in objects:
		if object.is_in_group("task_object"):
			object.set_outline(0)
