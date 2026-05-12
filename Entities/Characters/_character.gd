class_name Character extends CharacterBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var random_turns: bool = false

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
