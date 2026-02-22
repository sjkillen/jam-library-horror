extends Node

const MOUSE_SENSITIVITY := 0.1
const CONTROLLER_SENSITIVITY := 2.3

signal move_neutral


func camera_joystick() -> Vector2:
	return Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down") * GlobalInput.CONTROLLER_SENSITIVITY

func move_joystick() -> Vector2:
	return Input.get_vector("joy_move_left", "joy_move_right", "joy_move_up", "joy_move_down") * GlobalInput.CONTROLLER_SENSITIVITY

func keyboard_vector() -> Vector2:
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
