class_name DynamicObject extends RigidBody2D


@onready var sprite_2d: Sprite2D = $Sprite2D

@export_range(0.0, 400.0, 0.5) var minimum_force: float ## Minimum force required to move object.
@export var disabled: bool = false						## Turns ON sleeping indefinitely.
@export var task_object_id: int = 0						## Change value to belong to a specific target_area

# shader_material.set_shader_parameter("parameter_name", new_value)
# shader_material.set_shader_parameter("type", 0) <-- [0 - none, 1 - thin, 2 - thick]
const SHADER = preload("res://Themes/outline.gdshader")
var shader_material: ShaderMaterial

func _ready() -> void:
	shader_material = ShaderMaterial.new()
	shader_material.shader = SHADER
	sprite_2d.material = shader_material
	
	if minimum_force == 0:
		minimum_force = clamp(minimum_force, mass * 25, 400)

func _physics_process(delta: float) -> void:
	if disabled:
		sleeping = true

func apply_shove(mouse_dir: Vector2, applied_force: float):
	if applied_force >= minimum_force and not disabled:
		apply_central_impulse(mouse_dir * (applied_force))

func set_outline(mode: int = 0):
		sprite_2d.material.set_shader_parameter("type", mode)
