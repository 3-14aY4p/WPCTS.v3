class_name World extends Node2D


@onready var camera: CustomCamera = get_tree().get_first_node_in_group("camera")
@onready var player: Player = get_tree().get_first_node_in_group("player")

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
