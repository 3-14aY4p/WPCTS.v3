class_name CustomCamera extends Camera2D


@onready var player: Player = get_tree().get_first_node_in_group("player")
@onready var target = $"..":
	set(node):
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(self, 
			"global_position", 
			node.global_position, .5)
		reparent(node)
		
		await tween.finished
@export var override_zoom: Vector2 = Vector2.ZERO

var all_areas: Array[CameraZone] = []
var current_area: CameraZone
var camera_bounds: TileMapLayer

func _ready() -> void:
	zoom = Vector2(8, 8)
	await get_tree().process_frame

func _process(delta: float) -> void:
	all_areas.assign(get_tree().get_nodes_in_group("camera_zone"))
	
	camera_bounds = get_tree().get_first_node_in_group("camera_bounds")
	setup_camera_limits()
	_find_current_area()

func setup_camera_limits():
	if not camera_bounds:
		return
		
	var bounds_size := camera_bounds.tile_set.get_tile_size()
	var used_rect : Rect2i = camera_bounds.get_used_rect()
	
	limit_top = used_rect.position.y * bounds_size.y
	limit_bottom = (used_rect.position.y + used_rect.size.y) * bounds_size.y
	limit_left = used_rect.position.x * bounds_size.x
	limit_right = (used_rect.position.x + used_rect.size.x) * bounds_size.x

func _find_current_area():
	if not get_tree().get_first_node_in_group("camera_zone"):
		return
	else:
		if not target:
			return
			
		var target_pos: Vector2 = target.global_position
		if current_area and current_area.contains_point(target_pos):
			return
			
		var tween = get_tree().create_tween()
		for area in all_areas:
			if area.contains_point(target_pos):
				if override_zoom == Vector2.ZERO:
					tween.tween_property(self, "zoom", area.camera_zoom, 1.0)
				else:
					tween.tween_property(self, "zoom", override_zoom, 1.0)
