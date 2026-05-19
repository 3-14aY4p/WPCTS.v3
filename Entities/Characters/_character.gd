class_name Character extends CharacterBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var random_turns: bool = false
@export_range(0.0, 1, 0.001) var walk_speed: float = 0.004

func _physics_process(delta: float) -> void:
	if find_parent("PathFollow2D"):
		var parent: PathFollow2D = find_parent("PathFollow2D")
		if parent.progress_ratio != 1.0:
			parent.progress_ratio += walk_speed
			animated_sprite_2d.play("walk")
		else: animated_sprite_2d.play("idle")

func move_character(final_position, delta):
	velocity.move_toward(final_position, delta)

func turn():
	if randi_range(0, 1) == 1:
		if animated_sprite_2d.flip_h:
			animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.flip_h = true

func _on_timer_timeout() -> void: 
	if random_turns:
		turn()
