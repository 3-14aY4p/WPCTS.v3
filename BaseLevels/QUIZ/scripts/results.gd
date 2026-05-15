extends Control

const C_BG        := Color(0.176, 0.204, 0.278)
const C_PANEL     := Color(0.227, 0.271, 0.361)
const C_PANEL_BTN := Color(0.200, 0.247, 0.337)
const C_BORDER    := Color(0.420, 0.627, 0.420)
const C_GREEN_LT  := Color(0.659, 0.816, 0.659)
const C_GREEN_MID := Color(0.545, 0.753, 0.545)
const C_GREEN_DIM := Color(0.353, 0.545, 0.353)
const C_TEXT      := Color(0.780, 0.878, 0.718)

@onready var week_label:    Label  = $MarginContainer/VBox/Card/CardMargin/CardVBox/WeekLabel
@onready var complete_label:Label  = $MarginContainer/VBox/Card/CardMargin/CardVBox/CompleteLabel
@onready var score_label:   Label  = $MarginContainer/VBox/Card/CardMargin/CardVBox/ScoreLabel
@onready var denom_label:   Label  = $MarginContainer/VBox/Card/CardMargin/CardVBox/DenomLabel
@onready var grade_label:   Label  = $MarginContainer/VBox/Card/CardMargin/CardVBox/GradeLabel
@onready var correct_label: Label  = $MarginContainer/VBox/Card/CardMargin/CardVBox/StatsRow/CorrectStat/StatNum
@onready var wrong_label:   Label  = $MarginContainer/VBox/Card/CardMargin/CardVBox/StatsRow/WrongStat/StatNum
@onready var correct_lbl:   Label  = $MarginContainer/VBox/Card/CardMargin/CardVBox/StatsRow/CorrectStat/StatLbl
@onready var wrong_lbl:     Label  = $MarginContainer/VBox/Card/CardMargin/CardVBox/StatsRow/WrongStat/StatLbl
@onready var next_btn:      Button = $MarginContainer/VBox/Card/CardMargin/CardVBox/BtnRow/NextBtn

func _ready() -> void:
	var font: FontFile = load("res://Assets/Font/superstar_memesbruh03.ttf")
	($BG as ColorRect).color = C_BG

	var card_st := StyleBoxFlat.new()
	card_st.bg_color = C_PANEL; card_st.border_color = C_BORDER
	card_st.set_border_width_all(2); card_st.set_corner_radius_all(6)
	($MarginContainer/VBox/Card as PanelContainer).add_theme_stylebox_override("panel", card_st)

	var week_num: int = get_meta("week_num", 1)
	var score:    int = get_meta("score",    0)
	var total:    int = get_meta("total",    15)
	var correct:  int = get_meta("correct",  0)
	var wrong:    int = get_meta("wrong",    0)

	var wd: Dictionary    = QuestionData.WEEKS[week_num]
	var pct: int          = int(float(score) / float(total) * 100.0)
	var week_color: Color = wd["color"]

	for node in [week_label, complete_label, score_label, denom_label, grade_label,
			correct_label, wrong_label, correct_lbl, wrong_lbl, next_btn]:
		if font and node: node.add_theme_font_override("font", font)

	_style_lbl(week_label,     week_color,  14)
	_style_lbl(complete_label, C_TEXT,      14)
	_style_lbl(score_label,    C_TEXT,      28)
	_style_lbl(denom_label,    C_GREEN_DIM, 12)
	_style_lbl(correct_label,  C_TEXT,      14)
	_style_lbl(wrong_label,    C_TEXT,      14)
	_style_lbl(correct_lbl,    C_GREEN_DIM, 14)
	_style_lbl(wrong_lbl,      C_GREEN_DIM, 14)

	next_btn.add_theme_color_override("font_color",    C_TEXT)
	next_btn.add_theme_font_size_override("font_size", 11)
	var bs := StyleBoxFlat.new()
	bs.bg_color = C_PANEL; bs.border_color = C_BORDER
	bs.set_border_width_all(2); bs.set_corner_radius_all(4)
	bs.content_margin_left = 10; bs.content_margin_right  = 10
	bs.content_margin_top  = 6;  bs.content_margin_bottom = 6
	next_btn.add_theme_stylebox_override("normal", bs)
	var bh := bs.duplicate() as StyleBoxFlat
	bh.bg_color = Color(0.310, 0.459, 0.400); bh.border_color = C_GREEN_LT
	next_btn.add_theme_stylebox_override("hover",   bh)
	next_btn.add_theme_stylebox_override("pressed", bs)
	next_btn.add_theme_stylebox_override("focus",   StyleBoxEmpty.new())

	week_label.text    = "%s — %s" % [wd["label"], wd["topic"]]
	score_label.text   = "%d / %d" % [score, total]
	denom_label.text   = "questions correct (%d%%)" % pct
	correct_label.text = str(correct)
	wrong_label.text   = str(wrong)

	var grade_text: String; var grade_color: Color
	if   pct >= 90: grade_text = "Excellent!";                     grade_color = C_GREEN_LT
	elif pct >= 75: grade_text = "Good job!";                      grade_color = C_GREEN_MID
	elif pct >= 50: grade_text = "Passing - review the material";  grade_color = Color(0.85,0.78,0.35)
	else:           grade_text = "Keep studying!";                 grade_color = Color(0.85,0.45,0.45)
	grade_label.text = grade_text
	grade_label.add_theme_color_override("font_color",    grade_color)
	grade_label.add_theme_font_size_override("font_size", 14)

	next_btn.pressed.connect(func():
		GameController.transition_to_next_scene())

func _style_lbl(node: Label, color: Color, font_size: int) -> void:
	if node == null: return
	node.add_theme_color_override("font_color",    color)
	node.add_theme_font_size_override("font_size", font_size)
