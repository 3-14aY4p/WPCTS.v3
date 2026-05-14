extends Control

const LETTERS: Array[String]   = ["A","B","C","D"]

const C_BG        := Color(0.176, 0.204, 0.278)
const C_PANEL     := Color(0.227, 0.271, 0.361)
const C_PANEL_BTN := Color(0.200, 0.247, 0.337)
const C_BORDER    := Color(0.420, 0.627, 0.420)
const C_GREEN_LT  := Color(0.659, 0.816, 0.659)
const C_GREEN_MID := Color(0.545, 0.753, 0.545)
const C_GREEN_DIM := Color(0.353, 0.545, 0.353)
const C_TEXT      := Color(0.780, 0.878, 0.718)

var _week_num:      int   = 1
var _questions:     Array = []
var _current_index: int   = 0
var _score:         int   = 0
var _correct_count: int   = 0
var _wrong_count:   int   = 0
var _answered:      bool  = false
var _font:          FontFile
var _week_color:    Color

@onready var progress_label:  Label          = $MarginContainer/VBox/TopBar/ProgressLabel
@onready var score_label:     Label          = $MarginContainer/VBox/TopBar/ScoreLabel
@onready var topic_label:     Label          = $MarginContainer/VBox/TopicLabel
@onready var question_label:  RichTextLabel  = $MarginContainer/VBox/QuestionPanel/QuestionLabel
@onready var choices_vbox:    VBoxContainer  = $MarginContainer/VBox/ChoicesVBox
@onready var feedback_panel:  PanelContainer = $MarginContainer/VBox/FeedbackPanel
@onready var feedback_label:  RichTextLabel  = $MarginContainer/VBox/FeedbackPanel/FeedbackLabel
@onready var next_btn:        Button         = $MarginContainer/VBox/NextBtn

func _ready() -> void:
	_font      = load("res://Assets/Font/superstar_memesbruh03.ttf")
	_week_num  = get_meta("week_num", GameController.current_day - 1)
	var wd: Dictionary = QuestionData.WEEKS[_week_num]
	_week_color = wd["color"]

	($BG as ColorRect).color = C_BG

	# question panel style
	var qps := StyleBoxFlat.new()
	qps.bg_color = C_PANEL; qps.border_color = C_BORDER
	qps.set_border_width_all(2); qps.set_corner_radius_all(4)
	qps.content_margin_left = 10; qps.content_margin_right  = 10
	qps.content_margin_top  = 8;  qps.content_margin_bottom = 8
	($MarginContainer/VBox/QuestionPanel as PanelContainer).add_theme_stylebox_override("panel", qps)


	# FIX: renamed 'size' -> 'font_size'
	_style_node(progress_label, C_GREEN_DIM,  14)
	_style_node(score_label,    _week_color,  14)
	_style_node(topic_label,    _week_color,  14)
	_style_rtl(question_label,  C_TEXT,       14)
	_style_rtl(feedback_label,  C_TEXT,       15)
	_style_node(next_btn,       C_TEXT,       14)

	# next button style
	var nbs := StyleBoxFlat.new()
	nbs.bg_color = C_PANEL; nbs.border_color = C_BORDER
	nbs.set_border_width_all(2); nbs.set_corner_radius_all(4)
	nbs.content_margin_left = 10; nbs.content_margin_right  = 10
	nbs.content_margin_top  = 6;  nbs.content_margin_bottom = 6
	next_btn.add_theme_stylebox_override("normal", nbs)
	var nbh := nbs.duplicate() as StyleBoxFlat
	nbh.bg_color = Color(0.310, 0.459, 0.400); nbh.border_color = C_GREEN_LT
	next_btn.add_theme_stylebox_override("hover",   nbh)
	next_btn.add_theme_stylebox_override("pressed", nbs)
	next_btn.add_theme_stylebox_override("focus",   StyleBoxEmpty.new())

	_questions = wd["questions"].duplicate()
	_questions.shuffle()

	# FIX: SceneMgr.go() instead of manual get_tree() chaining
	next_btn.pressed.connect(_on_next_pressed)
	feedback_panel.visible = false
	next_btn.visible       = false
	_show_question()

# FIX: renamed 'size' -> 'font_size'
func _style_node(node: Control, color: Color, font_size: int) -> void:
	if node == null: return
	node.add_theme_color_override("font_color",  color)
	node.add_theme_font_size_override("font_size", font_size)
	if _font: node.add_theme_font_override("font", _font)

func _style_rtl(node: RichTextLabel, color: Color, font_size: int) -> void:
	if node == null: return
	node.add_theme_color_override("default_color", color)
	node.add_theme_font_size_override("normal_font_size", font_size)
	if _font:
		node.add_theme_font_override("normal_font", _font)
		node.add_theme_font_override("bold_font",   _font)


func _show_question() -> void:
	if _current_index >= _questions.size():
		_go_to_results()
		return
	_answered      = false

	var q: Dictionary = _questions[_current_index]
	topic_label.text    = QuestionData.WEEKS[_week_num]["topic"]
	progress_label.text = "%d / %d" % [_current_index + 1, _questions.size()]
	score_label.text    = "Score: %d" % _score
	question_label.text = "[b]Q%d.[/b]  %s" % [_current_index + 1, q["q"]]

	feedback_panel.visible = false
	next_btn.visible       = false

	for child in choices_vbox.get_children(): child.queue_free()
	for i in range(q["choices"].size()):
		choices_vbox.add_child(_make_choice_btn(i, q["choices"][i]))

func _make_choice_btn(idx: int, txt: String) -> Button:
	var btn := Button.new()
	btn.text = "[%s]  %s" % [LETTERS[idx], txt]
	btn.custom_minimum_size = Vector2(0, 28)
	btn.alignment           = HORIZONTAL_ALIGNMENT_LEFT
	btn.autowrap_mode       = TextServer.AUTOWRAP_WORD_SMART
	btn.clip_text           = false
	btn.add_theme_font_size_override("font_size", 12)
	btn.add_theme_color_override("font_color", C_TEXT)
	if _font: btn.add_theme_font_override("font", _font)

	var sn := StyleBoxFlat.new()
	sn.bg_color = C_PANEL_BTN; sn.border_color = C_BORDER
	sn.set_border_width_all(2); sn.set_corner_radius_all(4)
	sn.content_margin_left = 8; sn.content_margin_right  = 8
	sn.content_margin_top  = 4; sn.content_margin_bottom = 4
	btn.add_theme_stylebox_override("normal",  sn)
	var sh := sn.duplicate() as StyleBoxFlat
	sh.bg_color = Color(0.310, 0.459, 0.400); sh.border_color = C_GREEN_LT
	btn.add_theme_stylebox_override("hover",   sh)
	btn.add_theme_stylebox_override("pressed", sn.duplicate())
	btn.add_theme_stylebox_override("focus",   StyleBoxEmpty.new())
	btn.pressed.connect(_on_choice_pressed.bind(idx))
	return btn

func _on_choice_pressed(idx: int) -> void:
	if _answered: return
	_answered     = true
	var q: Dictionary = _questions[_current_index]
	var correct: int  = q["a"]
	var ok: bool      = (idx == correct)
	if ok: _score += 1; _correct_count += 1
	else:  _wrong_count += 1
	_highlight_buttons(idx, correct)
	_show_feedback(ok, q["choices"][correct])
	score_label.text = "Score: %d" % _score
	next_btn.visible = true


func _highlight_buttons(chosen: int, correct: int) -> void:
	for i in range(choices_vbox.get_child_count()):
		var btn: Button = choices_vbox.get_child(i)
		btn.disabled = true
		var st := StyleBoxFlat.new()
		st.set_corner_radius_all(4); st.set_border_width_all(2)
		st.content_margin_left = 8; st.content_margin_right  = 8
		st.content_margin_top  = 4; st.content_margin_bottom = 4
		if i == correct:
			st.bg_color = Color(0.10,0.25,0.15); st.border_color = C_GREEN_MID
			btn.add_theme_color_override("font_color", C_GREEN_LT)
		elif i == chosen:
			st.bg_color = Color(0.28,0.10,0.10); st.border_color = Color(0.72,0.30,0.30)
			btn.add_theme_color_override("font_color", Color(0.95,0.55,0.55))
		else:
			st.bg_color = Color(0.16,0.19,0.26); st.border_color = Color(0.28,0.33,0.42)
			btn.add_theme_color_override("font_color", C_GREEN_DIM)
		btn.add_theme_stylebox_override("disabled", st)

func _show_feedback(ok: bool, correct_text: String) -> void:
	feedback_panel.visible = true
	var st := StyleBoxFlat.new()
	st.set_corner_radius_all(4); st.set_border_width_all(2)
	st.content_margin_left = 10; st.content_margin_right  = 10
	st.content_margin_top  = 6;  st.content_margin_bottom = 6
	if ok:
		st.bg_color = Color(0.10,0.25,0.15); st.border_color = C_GREEN_MID
		feedback_label.text = "[color=#a8d0a8][b]Correct![/b][/color]"
	else:
		st.bg_color = Color(0.28,0.10,0.10); st.border_color = Color(0.72,0.30,0.30)
		feedback_label.text = "[color=#e08080][b]Incorrect.[/b][/color]  Correct: [b]%s[/b]" % correct_text
	feedback_panel.add_theme_stylebox_override("panel", st)


func _on_next_pressed() -> void:
	_current_index += 1
	_show_question()

# FIXME: DISPLAY RESULTS INSTEAD
func _go_to_results() -> void:
	SceneMgr.go(self, "uid://cbdg3gyx5hwfq", {
		"week_num": _week_num,
		"score":    _score,
		"total":    _questions.size(),
		"correct":  _correct_count,
		"wrong":    _wrong_count,
	})
