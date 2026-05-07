class_name PlayerIdle extends State


var player: Player

func enter():
	player = state_machine.get_parent()

func physics_update(delta: float):
	player.animation_player.play('idle')
	player.handle_look_dir(true)

func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("_up") or Input.is_action_just_pressed("_down") or Input.is_action_just_pressed("_left") or Input.is_action_just_pressed("_right"):
		state_machine.change_state("playerwalk")
	
	elif Input.is_action_just_pressed("_shove"):
		state_machine.change_state("playershove")
	
	elif Input.is_action_just_pressed("_grab"):
		var collided = player.handle_raycast_collision()
		if collided is DynamicObject and collided.is_in_group("pickable_object"):
			player.on_hand = collided
			state_machine.change_state("playercarry")
