class_name RandomizedObject extends DynamicObject


func _ready() -> void:
	super._ready()
	sprite_2d.frame = randi_range(0, 2)
