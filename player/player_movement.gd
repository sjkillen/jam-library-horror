extends Node

@onready var char_body: CharacterBody3D = get_parent()
@export var camera_rot: Node3D
@export var camera: Camera3D

const SPEED = 5.0
const MOUSE_SENSITIVITY = 0.1
const CONTROLLER_SENSITITY = 3.0

var camera_move_event: Vector2 = Vector2.ZERO

var prev_velocity := Vector3.ZERO

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	camera_move(delta)
	
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction: Vector3 = (camera_rot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		char_body.velocity.x = direction.x * SPEED
		char_body.velocity.z = direction.z * SPEED
	else:
		char_body.velocity.x = move_toward(char_body.velocity.x, 0, SPEED)
		char_body.velocity.z = move_toward(char_body.velocity.z, 0, SPEED)

	prev_velocity = char_body.velocity
	char_body.move_and_slide()

func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camera_move_event = event.relative * MOUSE_SENSITIVITY
	if event.is_action("toggle_mouse_capture"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
func camera_move(delta: float):
	var move := Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down") * CONTROLLER_SENSITITY
	if move == Vector2.ZERO:
		move = camera_move_event
	camera_move_event = Vector2.ZERO
	camera.global_rotation.x -= move.y*delta
	camera.global_rotation.x = clampf(camera.global_rotation.x, -1.0, 1.0)
	camera_rot.global_rotation.y -= move.x*delta
