class_name PlayerDisabled extends State


var player: Player

func enter():
	player = state_machine.get_parent()
	player.animation_player.play("idle")

func update(delta: float):
	InteractionHandler.can_interact = false
	InteractionHandler.label.hide()

func exit():
	InteractionHandler.can_interact = true
