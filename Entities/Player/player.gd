class_name Player extends CharacterBody2D


# State Machines
enum ControlState {
	NORMAL,
	DISABLED,
	KNOCKBACK
}
var control_state = ControlState.NORMAL

enum ActionState {
	NONE,
	SHOVE,
	CARRY
}
var action_state = ActionState.NONE

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var carry_point: Marker2D = $Sprite2D/Marker2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var place_point: Marker2D = $RayCast2D/Marker2D
@onready var force_meter: ProgressBar = %ForceMeter

const DEFAULT_SPEED: float = 60.0

var on_hand: DynamicObject = null
var mouse_dir: Vector2

var knockback_velocity: Vector2 = Vector2.ZERO
var knockback_decay: float = 8.0
var knockback_min_threshold: float = 10.0

func _ready() -> void:
	force_meter.hide()
	force_meter.value = 0
	
	reset_states()

func _physics_process(delta: float) -> void:
	mouse_dir = get_local_mouse_position().normalized()
	ray_cast_2d.look_at(get_global_mouse_position())
	
	handle_control(delta)
	handle_actions(delta)
	handle_movement()

# handle state machines
func reset_states():
	control_state = ControlState.NORMAL
	action_state = ActionState.NONE

# control state
func handle_control(delta):
	match control_state:
		ControlState.NORMAL:
			return
			
		ControlState.DISABLED:
			InteractionHandler.can_interact = false
			velocity = Vector2.ZERO
			move_and_slide()
			return
			
		ControlState.KNOCKBACK:
			InteractionHandler.can_interact = false
			knockback_velocity.lerp(Vector2.ZERO, knockback_decay * delta)
			velocity =  knockback_velocity
			move_and_slide()
			if knockback_velocity.length() < knockback_min_threshold:
				InteractionHandler.can_interact = true
				control_state = ControlState.NORMAL
				animation_player.play("idle")
			return

# action state
func handle_actions(delta):
	if control_state != ControlState.NORMAL:
		return
		
	match action_state:
		ActionState.NONE:
			wait_for_actions()
			
		ActionState.SHOVE:
			handle_shove()
			
		ActionState.CARRY:
			handle_carry()

func wait_for_actions():
	if Input.is_action_just_pressed("_shove"):
		animation_player.play("shove_charge")
		action_state = ActionState.SHOVE
	elif Input.is_action_just_pressed("_grab"):
		var object: DynamicObject = handle_raycast_collision()
		if object and object.is_in_group("pickable_object"):
			on_hand = object
			action_state = ActionState.CARRY

func handle_shove():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("_shove"):
		InteractionHandler.can_interact = false
		set_collision_layer_value(4, false)
		
		handle_look_dir(true)
		force_meter.show()
		force_meter.value += 1
		
	if Input.is_action_just_released("_shove"):
		animation_player.play("shove_release")
		
		var applied_force: float = force_meter.value * 4
		force_meter.hide()
		force_meter.value = 0
		
		var collided: DynamicObject = handle_raycast_collision()
		if collided:
			collided.apply_shove(mouse_dir, applied_force)
			set_collision_layer_value(4, true)
			handle_knockback(-mouse_dir, applied_force/1.5)
			control_state = ControlState.KNOCKBACK
		else:
			control_state = ControlState.NORMAL
			
		await animation_player.animation_finished
		action_state = ActionState.NONE

func handle_carry():
	pass

# other detection functions
func handle_movement():
	if control_state != ControlState.NORMAL:
		return
		
	var input_dir := Input.get_vector("_left", "_right", "_up", "_down")
	var movement: String
	var animation: String
	var speed := DEFAULT_SPEED
	
	if action_state == ActionState.CARRY:
		var modifier := on_hand.mass/2
		modifier = clamp(modifier, 2.0, 10.0)
		speed /= modifier
		movement = "carry_"
	else: movement = ""
	
	if input_dir == Vector2.ZERO:
		handle_look_dir(true)
		animation = "idle"
	else:
		handle_look_dir(false)
		animation = "walk"
		
	if action_state != ActionState.SHOVE:
		animation_player.play(movement + animation)
		
	velocity = input_dir * speed
	move_and_slide()

func set_control_state(new_state: ControlState):
	control_state = new_state
	if new_state == ControlState.DISABLED:
		velocity = Vector2.ZERO

func set_action_state(new_state: ActionState):
	if control_state != ControlState.NORMAL:
		return
	action_state = new_state
	if new_state == ActionState.NONE:
		on_hand = null


func handle_raycast_collision():
	var c = ray_cast_2d.get_collider()
	if c is DynamicObject and ray_cast_2d.is_colliding():
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
