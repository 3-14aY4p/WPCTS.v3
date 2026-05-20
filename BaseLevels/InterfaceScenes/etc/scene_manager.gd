class_name SceneManager

static func go(from: Node, scene_path: String, meta: Dictionary = {}) -> void:
	var tree := from.get_tree()
	if tree == null:
		push_error("SceneMgr.go: get_tree() is null — called too late from '%s'" % from.name)
		return
	var packed: PackedScene = load(scene_path)
	if packed == null:
		push_error("SceneMgr.go: cannot load '%s'" % scene_path)
		return
	var next: Node = packed.instantiate()
	for key in meta:
		next.set_meta(key, meta[key])
	tree.root.add_child(next)
	tree.current_scene = next
	tree.root.remove_child(from)
	from.queue_free()
