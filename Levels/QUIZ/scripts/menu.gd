extends Control

const C_BG        := Color(0.176, 0.204, 0.278)
const C_PANEL     := Color(0.227, 0.271, 0.361)
const C_PANEL_BTN := Color(0.200, 0.247, 0.337)
const C_BORDER    := Color(0.420, 0.627, 0.420)
const C_GREEN_LT  := Color(0.659, 0.816, 0.659)
const C_GREEN_MID := Color(0.545, 0.753, 0.545)
const C_GREEN_DIM := Color(0.353, 0.545, 0.353)
const C_TEXT      := Color(0.780, 0.878, 0.718)

var _font: FontFile

@onready var cards_vbox: VBoxContainer = $MarginContainer/VBox/CardsVBox

func _ready() -> void:
	_font = load("res://fonts/superstar_memesbruh03.ttf")
	($BG as ColorRect).color = C_BG
	_style_label($MarginContainer/VBox/HeadingVBox/Heading,    C_TEXT,      18)
	_style_label($MarginContainer/VBox/HeadingVBox/SubHeading, C_GREEN_MID, 14)

	var row0 := HBoxContainer.new()
	row0.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row0.add_theme_constant_override("separation", 8)
	row0.add_child(_make_card(0, QuestionData.WEEKS[0]))
	cards_vbox.add_child(row0)

	var row1 := HBoxContainer.new()
	row1.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row1.add_theme_constant_override("separation", 8)
	row1.add_child(_make_card(1, QuestionData.WEEKS[1]))
	row1.add_child(_make_card(2, QuestionData.WEEKS[2]))
	cards_vbox.add_child(row1)

	var row2 := HBoxContainer.new()
	row2.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row2.add_theme_constant_override("separation", 8)
	row2.add_child(_make_card(3, QuestionData.WEEKS[3]))
	row2.add_child(_make_card(4, QuestionData.WEEKS[4]))
	cards_vbox.add_child(row2)

# FIX: renamed 'size' -> 'font_size' (was shadowing Control.size)
func _style_label(node: Node, color: Color, font_size: int) -> void:
	if node == null: return
	var lbl := node as Label
	lbl.add_theme_color_override("font_color", color)
	lbl.add_theme_font_size_override("font_size", font_size)
	if _font: lbl.add_theme_font_override("font", _font)

func _make_card(week_num: int, data: Dictionary) -> PanelContainer:
	var panel := PanelContainer.new()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.size_flags_vertical   = Control.SIZE_EXPAND_FILL
	panel.custom_minimum_size   = Vector2(0, 58)

	var style := StyleBoxFlat.new()
	style.bg_color     = C_PANEL
	style.border_color = C_BORDER       
	style.set_border_width_all(2)
	style.border_width_top = 3
	style.set_corner_radius_all(4)
	style.content_margin_left   = 10
	style.content_margin_right  = 10
	style.content_margin_top    = 8
	style.content_margin_bottom = 8
	panel.add_theme_stylebox_override("panel", style)

	var vbox := VBoxContainer.new()
	vbox.add_theme_constant_override("separation", 3)
	vbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	vbox.size_flags_vertical   = Control.SIZE_EXPAND_FILL

	var week_label := Label.new()
	week_label.text = data["label"].to_upper()
	week_label.add_theme_color_override("font_color", C_GREEN_MID)
	week_label.add_theme_font_size_override("font_size", 12)
	if _font: week_label.add_theme_font_override("font", _font)

	var title_label := Label.new()
	title_label.text = data["topic"]
	title_label.add_theme_color_override("font_color", C_TEXT)
	title_label.add_theme_font_size_override("font_size", 12)
	title_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	title_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
	if _font: title_label.add_theme_font_override("font", _font)

	var count_label := Label.new()
	count_label.text = "10 questions"
	count_label.add_theme_color_override("font_color", C_GREEN_DIM)
	count_label.add_theme_font_size_override("font_size", 12)
	if _font: count_label.add_theme_font_override("font", _font)

	vbox.add_child(week_label)
	vbox.add_child(title_label)
	vbox.add_child(count_label)
	panel.add_child(vbox)

	var btn := Button.new()
	btn.flat = true
	btn.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	for state in ["normal","hover","pressed","focus"]:
		btn.add_theme_stylebox_override(state, StyleBoxEmpty.new())
	panel.add_child(btn)

	btn.pressed.connect(func(): SceneMgr.go(self, "res://scenes/quiz_week_%d.tscn" % week_num))
	btn.mouse_entered.connect(func():
		style.bg_color     = Color(0.310, 0.459, 0.400)
		style.border_color = C_GREEN_LT)
	btn.mouse_exited.connect(func():
		style.bg_color     = C_PANEL
		style.border_color = C_BORDER)
	return panel
