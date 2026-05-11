class_name PlayerWalk extends State


var player: Player

func enter():
	player = state_machine.get_parent()

func physics_update(delta: float):
	player.animation_player.play("walk")
	player.handle_look_dir(true)
	player.handle_movement()
	
	if player.velocity == Vector2.ZERO:
		state_machine.change_state("playeridle")

func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("_shove"):
		state_machine.change_state("playershove")
		
	elif Input.is_action_just_pressed("_grab"):
		var collided = player.handle_raycast_collision()
		if collided is DynamicObject and collided.is_in_group("pickable_object") and not collided.disabled:
			player.on_hand = collided
			state_machine.change_state("playercarry")
