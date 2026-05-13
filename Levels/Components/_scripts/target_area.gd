class_name TargetArea extends Area2D


@onready var player: Player = get_tree().get_first_node_in_group("player")
@onready var label: Label = $Label

@export var object_group: String = "task_object"
@export var task_area_id: int = 0
@export var object_limit: int = 1
@export var object_persistence: bool = true
@export var deactivated: bool = true
@export var is_task_started: bool = false

var objects_delivered: int = 0
var objects_in_area: Array

var area_goal_reached: bool = false
@export var hide_label: bool = false

func _ready() -> void:
	label.hide()
	update_label()

func _physics_process(delta: float) -> void:
	if not player:
		player = get_tree().get_first_node_in_group("player")
		
	if is_task_started:
		if find_parent("Player"):
			deactivated = true
		else: deactivated = false
		
	if object_group == "player":
		hide_label = true
		
	var mouse_pos: Vector2 = get_global_mouse_position()
	if global_position.distance_to(mouse_pos) <= 20 and not deactivated and not hide_label:
		label.show()
	else:
		label.hide()
		
	if object_persistence:
		if objects_in_area.size() >= object_limit:
			area_goal_reached = true
		else:
			area_goal_reached = false
	else:
		if objects_delivered >= object_limit:
			area_goal_reached = true

func update_label():
	if object_persistence:
		label.text = "%d/%d" % [objects_in_area.size(), object_limit]
	else:
		label.text = "%d/%d" % [objects_delivered, object_limit]

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(object_group) and body.task_object_id == task_area_id and not deactivated:
		if object_persistence:
			objects_in_area.append(body)
			update_label()
		else:
			if area_goal_reached:
				return
			else:
				objects_delivered += 1
				update_label()
				body.queue_free()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group(object_group) and body.task_object_id == task_area_id and not deactivated:
		objects_in_area.erase(body)
		update_label()
