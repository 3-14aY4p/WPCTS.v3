class_name TaskController extends Node

signal task_start
signal task_completed
signal task_failed

@onready var task_objects: Array = get_tree().get_nodes_in_group("task_object")
@onready var target_areas: Array = get_tree().get_nodes_in_group("target_area")
@onready var area_boundary: TileMapLayer = $AreaBoundary

enum TaskType {
	PLACE, 				## Player must get the object into the area and make it stay there.
	BRING,				## Player bring the object to the area, and the object gets deleted.
	REACH				## Player must reach the target area.
}
@export var task_type: TaskType

@export_range(0, 240, 1) var time_limit: int = 30
var timer: Timer

enum TaskState {
	AVAILABLE,
	ONGOING,
	COMPLETED,
}
@export var task_state: TaskState

# MOVE START TASK SOMEWHERE ELSE!!!
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		start_task()


func _ready() -> void:
	area_boundary.hide()
	if task_type == TaskType.PLACE:
		for area: TargetArea in target_areas:
			area.object_persistence = true
			area.object_group = "task_object"
	elif task_type == TaskType.BRING:
		for area: TargetArea in target_areas:
			area.object_persistence = false
			area.object_group = "task_object"
	elif task_type == TaskType.REACH:
		for area: TargetArea in target_areas:
			area.object_persistence = true
			area.task_area_id = 69
			area.object_group = "player"

func _physics_process(delta: float) -> void:
	var completed_items: Array
	for area: TargetArea in target_areas:
		if area.area_goal_reached:
			completed_items.append(area)
		else:
			completed_items.erase(area)
			
	if completed_items.size() == target_areas.size():
		complete_task()

func highlight_task_objects(mode: int = 1):
	for object: DynamicObject in task_objects:
		object.set_outline(mode)

func start_task():
	if task_state == TaskState.AVAILABLE:
		task_state = TaskState.ONGOING
		
		highlight_task_objects(1)
		for area: TargetArea in target_areas:
			area.deactivated = false
		area_boundary.show()
		
		if time_limit != 0:
			timer = Timer.new()
			add_child(timer)
			
			timer.autostart = false
			timer.start(time_limit)
			timer.connect("timeout", on_time_exceeded)
			
		task_start.emit()

func complete_task():
	if task_state == TaskState.ONGOING:
		task_state = TaskState.COMPLETED
		
		area_boundary.hide()
		for area: TargetArea in target_areas:
			area.deactivated = true
			
		if time_limit != 0:
			timer.stop()
			
		task_completed.emit()
		queue_free()

func fail_task():
	if task_state == TaskState.ONGOING:
		task_state = TaskState.AVAILABLE
		task_failed.emit()

func on_time_exceeded():
	fail_task()
