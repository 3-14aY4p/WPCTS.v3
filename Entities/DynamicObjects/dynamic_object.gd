class_name DynamicObject extends RigidBody2D


@export_range(1.0, 400.0, 0.5) var minimum_force: float ## Minimum force required to move object.
@export var disabled: bool = false						## Turns ON sleeping indefinitely.

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if disabled:
		sleeping = true

func apply_shove(mouse_dir: Vector2, applied_force: float):
	if applied_force >= minimum_force and not disabled:
		apply_central_impulse(mouse_dir * (applied_force))
