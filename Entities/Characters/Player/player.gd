class_name Player extends CharacterBody2D


@onready var state_machine: StateMachine = $StateMachine

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var carry_point: Marker2D = $Sprite2D/Marker2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var place_point: Marker2D = $RayCast2D/Marker2D
@onready var force_meter: ProgressBar = %ForceMeter

@export var task_object_id: int = 69

const DEFAULT_SPEED: float = 60.0

var on_hand: DynamicObject = null
var mouse_dir: Vector2
var force_dir: Vector2
var applied_force: float

var knockback_velocity: Vector2 = Vector2.ZERO
var knockback_decay: float = 8.0
var knockback_min_threshold: float = 10.0

func _ready() -> void:
	force_meter.hide()
	force_meter.value = 0

func _physics_process(delta: float) -> void:
	mouse_dir = get_local_mouse_position().normalized()
	ray_cast_2d.look_at(get_global_mouse_position())


func handle_movement(speed: float = DEFAULT_SPEED):
	velocity = Input.get_vector("_left", "_right", "_up", "_down") * speed
	move_and_slide()

func handle_raycast_collision():
	var c = ray_cast_2d.get_collider()
	if c and ray_cast_2d.is_colliding():
		return c

func handle_knockback(direction: Vector2, force: float):
	knockback_velocity = direction * force * 0.5

func handle_look_dir(isAiming: bool = false):
	if isAiming:
		if mouse_dir.x < 0:
			sprite_2d.flip_h = true
		elif mouse_dir.x > 0:
			sprite_2d.flip_h = false
	else:
		if velocity.x < 0:
			sprite_2d.flip_h = true
		elif velocity.x > 0:
			sprite_2d.flip_h = false
