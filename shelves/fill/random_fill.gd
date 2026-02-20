extends Node3D

var filled_variants: Array[PackedScene] = [
	preload("res://shelves/fill/filled_shelf_variant_1.tscn"),
	preload("res://shelves/fill/filled_shelf_variant_2.tscn"),
	preload("res://shelves/fill/filled_shelf_variant_3.tscn"),
	preload("res://shelves/fill/filled_shelf_variant_4.tscn"),
	preload("res://shelves/fill/filled_shelf_variant_5.tscn"),
	preload("res://shelves/fill/filled_shelf_variant_6.tscn"),
	preload("res://shelves/fill/filled_shelf_variant_7.tscn"),
]

func _ready() -> void:
	var ps: PackedScene = filled_variants.pick_random()
	var node: Node3D = ps.instantiate()
	get_parent_node_3d().call_deferred("add_sibling", node)
	await node.ready
	node.global_transform = global_transform
	queue_free()
