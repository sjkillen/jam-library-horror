extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		GlobalEvents.player_entered_speed_boost_area.emit()

func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		GlobalEvents.player_left_speed_boost_area.emit()
