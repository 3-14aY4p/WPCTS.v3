class_name AssessmentInterface extends Control


@onready var q_label: RichTextLabel = %QuestionLabel
@onready var cb_1: ChoiceButton = %ChoiceButton1
@onready var cb_2: ChoiceButton = %ChoiceButton2
@onready var cb_3: ChoiceButton = %ChoiceButton3
@onready var cb_4: ChoiceButton = %ChoiceButton4

@onready var timer: Timer = $Timer
@onready var time_indicator: TextureProgressBar = %TimeIndicator
@onready var time_label: RichTextLabel = $CanvasLayer/TimeIndicator/TimeLabel
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var progress_label: Label = %ProgressLabel

@onready var right_sfx: AudioStreamPlayer = $RightSFX
@onready var wrong_sfx: AudioStreamPlayer = $WrongSFX

@export var answer_window: float = 15

var _total_score: int
var _total_misses: int
var _total_q: int

var qbank: Array
var active_qbank: Array
var current_index: int = 0

func _ready() -> void:
	if AudioManager.active_music_stream != AudioManager.clips.get_node("DORM"):
		AudioManager.play_music("QUIZ")
	
	qbank = QuestionData.WEEKS[GameController.current_week - 1]['questions']
	active_qbank = qbank.duplicate(true)	# making an editable copy
	
	active_qbank.shuffle()
	_total_q = active_qbank.size() - 5		# we leave out 5 for the next random
	active_qbank.resize(_total_q)			# resizing to fit total questions
	
	progress_bar.value = 0
	progress_bar.max_value = _total_q
	timer.wait_time = answer_window
	time_indicator.max_value = answer_window
	
	update_progress()
	next_question()

func _physics_process(delta: float) -> void:
	time_indicator.value = timer.time_left
	time_label.text = str(int(time_indicator.value))

func next_question():
	timer.start(answer_window)
	
	q_label.text = active_qbank[current_index]['q']
	
	cb_1.text = "a. %s" % active_qbank[current_index]['choices'][0]
	cb_2.text = "b. %s" % active_qbank[current_index]['choices'][1]
	cb_3.text = "c. %s" % active_qbank[current_index]['choices'][2]
	cb_4.text = "d. %s" % active_qbank[current_index]['choices'][3]

func check_answer(answer_id: int):
	if answer_id == active_qbank[current_index]['a']:
		_total_score += 1
		right_sfx.play(0.0)
	else:
		_total_misses += 1
		wrong_sfx.play(0.0)
		
	update_progress()
	if current_index >= _total_q - 1:
		go_to_results()
	else:
		current_index += 1
		next_question()

func update_progress():
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(progress_bar, "value", current_index + 1, 0.5)
	
	progress_label.text = "%d out of %d" % [current_index + 1, _total_q]

func go_to_results():
	SceneManager.go(self, "uid://c42vv3i5kbptl", {
		"total_score": _total_score,
		"total_q": _total_q,
	})

func record_results():
	GameController.weekly_score.append(_total_score)

func _on_timer_timeout() -> void:
	_total_misses += 1
	update_progress()

func _on_choice_button_1_pressed() -> void:
	check_answer(0)
func _on_choice_button_2_pressed() -> void:
	check_answer(1)
func _on_choice_button_3_pressed() -> void:
	check_answer(2)
func _on_choice_button_4_pressed() -> void:
	check_answer(3)
