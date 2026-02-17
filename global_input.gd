extends Node

const MOUSE_SENSITIVITY := 0.1
const CONTROLLER_SENSITIVITY := 2.3

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("disable_mouse_capture"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif  event.is_action_pressed("enable_mouse_capture"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		

func camera_joystick() -> Vector2:
	return Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down") * GlobalInput.CONTROLLER_SENSITIVITY

func move_joystick() -> Vector2:
	return Input.get_vector("joy_move_left", "joy_move_right", "joy_move_up", "joy_move_down") * GlobalInput.CONTROLLER_SENSITIVITY

func keyboard_vector() -> Vector2:
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
