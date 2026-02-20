extends CharacterBody3D
class_name Player


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		query_interact_pickup()

func query_interact_pickup():
	%RayCast3D.force_raycast_update()
	var col = %RayCast3D.get_collider()
	if col is CollisionObject3D:
		var col_p = col.get_parent()
		if col_p is ClosedBook:
			col_p.attach_to_player(self)
		
		

func interact_equip():
	if %Movement.examining:
		%Movement.examining = false
		%HandheldBook.unequip()
		%Movement.enable_keyboard_look = false
	else:
		%Movement.examining = true
		%HandheldBook.equip()
		await GlobalInput.move_neutral
		if %Movement.examining:
			%Movement.enable_keyboard_look = true

func get_attach_point() -> Vector3:
	return %AttachPoint.global_position

func get_attach_rot() -> Vector3:
	return %AttachPoint.global_rotation
