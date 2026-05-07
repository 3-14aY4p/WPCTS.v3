class_name PlayerKnockback extends State


var player: Player

func enter():
	player = state_machine.get_parent()
	InteractionHandler.can_interact = false
	
	player.handle_knockback(-player.force_dir, player.applied_force/1.5)
	player.animation_player.play("knockback")

func physics_update(delta: float):
	player.knockback_velocity = player.knockback_velocity.lerp(Vector2.ZERO, player.knockback_decay * delta)
	
	player.velocity = player.knockback_velocity
	player.move_and_slide()
	if player.knockback_velocity.length() < player.knockback_min_threshold:
		state_machine.change_state("playeridle")

func exit():
	InteractionHandler.can_interact = true
