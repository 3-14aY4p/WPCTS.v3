class_name Level extends Node2D


@onready var camera: CustomCamera = get_tree().get_first_node_in_group("camera")
@onready var player: Player = get_tree().get_first_node_in_group("player")

@export var exit_points: Array[ExitPoint]

func _ready() -> void:
	pass

func _on_task_controller_task_completed() -> void:
	for exit in exit_points:
		exit.locked = false
		
	var objects: Array = get_tree().get_first_node_in_group("object_container").get_children()
	for object: DynamicObject in objects:
		object.set_outline(0)

func _on_task_controller_task_failed() -> void:
	pass # Replace restart screen.
