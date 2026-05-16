class_name PlayerShove extends State


var player: Player

func enter():
	player = state_machine.get_parent()
	InteractionHandler.can_interact = false
	
	player.animation_player.play("shove_charge")
	player.set_collision_layer_value(4, false)
	
	player.force_meter.value = 0
	player.force_meter.show()

func physics_update(delta: float):
	player.handle_look_dir(true)
	player.force_meter.value += 1
	
	if Input.is_action_just_released("_shove"):
		player.animation_player.play("shove_release")
		
		player.applied_force = player.force_meter.value * 4
		player.force_dir = player.mouse_dir
		var collided = player.handle_raycast_collision()
		if collided is DynamicObject and collided.is_in_group("shoveable_object"):
			collided.apply_shove(player.force_dir, player.applied_force)
			player.set_collision_layer_value(4, true)
			
			state_machine.change_state("playerknockback")
			
		await player.animation_player.animation_finished
		
		if player.velocity == Vector2.ZERO:
			state_machine.change_state("playeridle")
		else:
			state_machine.change_state("playerwalk")

func exit():
	InteractionHandler.can_interact = true
	player.force_meter.hide()
	player.force_meter.value = 0
