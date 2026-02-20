extends Node3D
class_name ClosedBook

var player = weakref(null)

func attach_to_player(p: Player):
	player = weakref(p)

func _physics_process(delta: float) -> void:
	var p = player.get_ref()
	if p is not Player:
		return
	#global_position = p.get_attach_point()
	#global_rotation = p.get_attach_rot()
	
	var target: Vector3 = p.get_attach_point()
	print("grab")
	%book.apply_force((target - global_position).normalized())
