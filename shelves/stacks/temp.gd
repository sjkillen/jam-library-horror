@tool
extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		child.scale *= 10.
		child.position *= 10.
