class_name PlayerCarry extends State


var player: Player

func enter():
	player = state_machine.get_parent()
	
	player.carry_sfx.play(0.0)
	InteractionHandler.can_interact = false
	
	player.on_hand.set_collision_layer_value(3, false)
	player.on_hand.reparent(player.carry_point)
	
	if player.on_hand.is_in_group("light_object"):
		player.on_hand.z_index = 1

func physics_update(delta: float):
	player.on_hand.global_position = player.carry_point.global_position
	
	var modifier = player.on_hand.mass/2
	modifier = clamp(modifier, 2.0, 10.0)
	
	if player.on_hand.is_in_group("light_object"):
		player.handle_movement(player.DEFAULT_SPEED/1.2)
	else:
		player.handle_movement(player.DEFAULT_SPEED/modifier)
	player.handle_look_dir(true)
	
	if player.velocity == Vector2.ZERO:
		player.animation_player.play("carry_idle")
	else:
		player.animation_player.play("carry_walk")

func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("_drop"):
		var collided = player.handle_raycast_collision()
		if collided == null:
			player.on_hand.reparent(get_tree().get_first_node_in_group("object_container"))
			player.on_hand.global_position = player.place_point.global_position
			
			player.carry_sfx.play(0.0)
			state_machine.change_state("playeridle")

func exit():
	player.on_hand.set_collision_layer_value(3, true)
	player.on_hand = null
	InteractionHandler.can_interact = true
