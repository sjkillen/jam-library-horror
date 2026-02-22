extends NavigationRegion3D


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("disable_mouse_capture"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif  event.is_action_pressed("enable_mouse_capture"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if GlobalInput.keyboard_vector() == Vector2.ZERO:
		GlobalInput.move_neutral.emit()
		
