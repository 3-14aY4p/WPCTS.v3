class_name TaskController extends Node

signal task_start
signal task_complete
signal task_fail

@onready var area_boundary: TileMapLayer = $AreaBoundary
@onready var target_areas: Array = get_tree().get_nodes_in_group("target_area")

@export var task_id: String = ""

enum TaskType {
	PLACE, 				## Player must get the object into the area and make it stay there.
	BRING,				## Player bring the object to the area, and the object gets deleted.
	REACH,				## Player must reach the target area.
	MIXED,				## Mix of different task types
}
@export var task_type: TaskType
@export_range(0.0, 240.0, 1) var time_limit: float = 0.0
var timer: Timer

enum TaskState {
	AVAILABLE,
	ONGOING,
	COMPLETED,
}
var task_state: TaskState

func _ready() -> void:
	area_boundary.hide()
	
	if task_type == TaskType.PLACE:
		for area: TargetArea in target_areas:
			area.object_persistence = true
			
	elif task_type == TaskType.BRING:
		for area: TargetArea in target_areas:
			area.object_persistence = false
			
	elif task_type == TaskType.REACH:
		for area: TargetArea in target_areas:
			area.object_persistence = true
			area.task_area_id = 69
			area.task_object_group = "player"

func _physics_process(delta: float) -> void:
	var completed_areas: Array
	for area: TargetArea in target_areas:
		if area.is_area_cleared:
			completed_areas.append(area)
		else: completed_areas.erase(area)
			
	if completed_areas.size() == target_areas.size():
		_complete_task()

func _start_task():
	AudioManager.play_music("BTHR")
	
	if task_state == TaskState.AVAILABLE:
		task_state = TaskState.ONGOING
		
		for area: TargetArea in target_areas:
			area.deactivated = false
			area.is_task_started = true
		area_boundary.show()
		
		if time_limit > 0:
			timer = Timer.new()
			add_child(timer)
			
			timer.autostart = false
			timer.start(time_limit)
			timer.connect("timeout", _fail_task)
			
		task_start.emit()

func _complete_task():
	if task_state == TaskState.ONGOING:
		task_state = TaskState.COMPLETED
		
		area_boundary.hide()
		for area: TargetArea in target_areas:
			area.queue_free()
			
		if time_limit != 0:
			timer.stop()
			
		task_complete.emit()
		queue_free()

func _fail_task():
	if task_state == TaskState.ONGOING:
		task_state = TaskState.AVAILABLE
		
		task_fail.emit()
		queue_free()
