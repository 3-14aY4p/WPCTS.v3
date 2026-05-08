class_name TargetArea extends Area2D


@onready var player: Player = get_tree().get_first_node_in_group("player")
@onready var label: Label = $Label

@export var task_area_id: int = 0
@export var deactivated: bool = true
@export var object_limit: int = 1
var objects_in_area: Array[DynamicObject]

var area_goal_reached: bool = false
var disabled: bool = false

func _ready() -> void:
	label.hide()
	update_label()

func _physics_process(delta: float) -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	if global_position.distance_to(mouse_pos) <= 20 and not deactivated:
		label.show()
	else:
		label.hide()
		
	if not player:
		player = get_tree().get_first_node_in_group("player")
		
	if objects_in_area.size() >= object_limit:
		area_goal_reached = true
	else:
		area_goal_reached = false
		
	if disabled:
		label.hide()

func update_label():
	label.text = "%d/%d" % [objects_in_area.size(), object_limit]

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("task_object") and body.task_object_id == task_area_id and not deactivated:
		objects_in_area.append(body)
		update_label()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("task_object") and body.task_object_id == task_area_id and not deactivated:
		objects_in_area.erase(body)
		update_label()
