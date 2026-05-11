class_name TutorialPopup extends Control


@onready var exit_hint: RichTextLabel = $CanvasLayer/NinePatchRect/ExitHint
@onready var tutorial_label: RichTextLabel = %TutorialLabel
@onready var prev_button: Button = %PrevButton
@onready var next_button: Button = %NextButton
@onready var indicator: TextureRect = %Indicator
var frame_coords: Array = [
	Rect2(0, 16, 16, 16),
	Rect2(16, 16, 16, 16),
	Rect2(32, 16, 16, 16),
	Rect2(48, 16, 16, 16),
]
var current_frame: int = 0
var indicator_texture: AtlasTexture

var tutorial_pages: Array[String] = [
"[font size=26]PLAYER CONTROLS !!![/font]
[font size=22][pulse]WASD[/pulse][/font] --------> Movement
[font size=22][pulse]RMB[/pulse][/font] -------------> Shove
[font size=22][pulse]LMB[/pulse][/font] ---------> Grab/Drop
[font size=22][pulse]E[/pulse][/font] --------------> Interact",

"[font size=28]INTRODUCTION[/font]
In this game, you will be taught Newton's Laws of
Motion through [pulse]LECTURES[/pulse], [pulse]TASKS[/pulse], and [pulse]ASSESSMENTS[/pulse].",

"[font size=28]on LECTURES[/font] 
========================
Just [pulse]listen[/pulse] to the Professor
and you'll probably end up
fine. (I hope so, at least!)",

"[font size=28]on TASKS[/font]
========================
Your GOAL is to get all the
task [pulse]objects[/pulse] into their own
designated [pulse]areas[/pulse].",

"[font size=28]on ASSESSMENTS[/font] 
========================
Your goal is to reach get
at least [pulse]75%[/pulse] of the test
right. You FAIL otherwise.",

"[font size=28]That's it?[/font] [font size=12][fade](yes, it is.)[/fade][/font]
[shake]Goodluck out there!![/shake]",
]
var current_page: int = 0

func _ready() -> void:
	prev_button.hide()
	current_page = 0
	indicator_texture = indicator.get("texture")
	indicator_texture.region = frame_coords[0]

func _process(delta: float) -> void:
	tutorial_label.text = tutorial_pages[current_page]
	indicator_texture.region = frame_coords[current_frame]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("_exit"):
		queue_free()

func _on_prev_button_pressed() -> void:
	next_button.show()
	exit_hint.hide()
	current_page -= 1
	if current_page <= 0:
		prev_button.hide()
		current_page = 0
		
	current_frame -= 1
	if current_frame < 0:
		current_frame = frame_coords.size() - 1
		return
	indicator.position.x -= 16

func _on_next_button_pressed() -> void:
	prev_button.show()
	current_page += 1
	indicator.position.x += 16
	if current_page >= tutorial_pages.size() - 1:
		next_button.hide()
		exit_hint.show()
		current_page = tutorial_pages.size() - 1
		indicator.position.x -= 16
		
	current_frame += 1
	if current_frame > frame_coords.size() - 1:
		current_frame = 0
