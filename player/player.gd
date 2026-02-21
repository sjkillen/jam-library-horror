extends CharacterBody3D
class_name Player

var holding = null
var finished := false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if holding == null:
			query_interact_pickup()
		else:
			interact_equip()

func query_interact_pickup():
	%RayCast3D.force_raycast_update()
	var col = %RayCast3D.get_collider()
	if col is CollisionObject3D:
		var col_p = col.get_parent()
		if col_p is ClosedBook:
			col_p.attach_to_player(self)
			holding = col_p
			return
	return
		
		

func interact_equip():
	if %Movement.examining:
		if finished:
			finish()
		%Movement.examining = false
		%Movement.enable_keyboard_look = false
		%HandheldBook.unreading.emit()
		await %HandheldBook.unequip()
		if holding:
			holding.visible = true
		%HandheldBook.visible = true		
	else:
		if holding:
			holding.visible = false
		%HandheldBook.visible = true
		%Movement.examining = true
		%HandheldBook.equip()
		await GlobalInput.move_neutral
		if %Movement.examining:
			%Movement.enable_keyboard_look = true

func get_attach_point() -> Vector3:
	return %AttachPoint.global_position

func get_attach_rot() -> Vector3:
	return %AttachPoint.global_rotation

func get_attach_scale() -> Vector3:
	return %AttachPoint.global_rotation

func finish():
	holding.queue_free()
	holding = null
	%HandheldBook.finish()
	finished = false
	$CanvasLayer.clear()
	GlobalBooks.finish()

func _on_canvas_layer_finished_book() -> void:
	finished = true
	
