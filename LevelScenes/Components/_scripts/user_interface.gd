class_name UI extends CanvasLayer


@onready var timer_label: RichTextLabel = $TaskUI/TimerLabel
@onready var completion_popup: Control = $TaskUI/CompletionPopup
@onready var animation_player: AnimationPlayer = $TaskUI/AnimationPlayer

@export var task: TaskController

func _ready() -> void:
	timer_label.hide()

func _physics_process(delta: float) -> void:
	if task:
		if task.task_state == task.TaskState.ONGOING:
			update_timer_label()

func update_timer_label():
	if task.task_state == task.TaskState.ONGOING:
		timer_label.show()
		if task.time_limit > 0:
			var m: int = task.timer.time_left/60
			var s: int = fmod(task.timer.time_left, 60)
			if s >= 10:
				timer_label.text = "%d:%d" % [m, s]
			else:
				timer_label.text = "%d:0%d" % [m, s]
		else: timer_label.text = ""

func _on_task_controller_task_completed() -> void:
	animation_player.play("task_complete")
