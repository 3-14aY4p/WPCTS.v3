extends Node
# this is an autoload

@onready var player: Player = get_tree().get_first_node_in_group("player")
@onready var label: Label = $Label

var can_interact: bool = true
var selected: InteractableArea

func _process(delta: float) -> void:
	if not player:
		player = get_tree().get_first_node_in_group("player")
		
	if selected and can_interact:
		label.text = selected.get_parent().action_hint
		label.global_position = selected.global_position
		label.global_position.y -= 32
		label.global_position.x -= label.size.x / 2
		label.show()
	else:
		label.hide()
