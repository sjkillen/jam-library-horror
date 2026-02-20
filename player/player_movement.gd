extends Node
class_name Movement

@onready var char_body: CharacterBody3D = get_parent()
@export var camera_rot: Node3D
@export var camera: Camera3D

@export var wwise_walking_true: WwiseState
@export var wwise_walking_false: WwiseState
var is_walking = false

var SPEED := 60

var camera_move_event: Vector2 = Vector2.ZERO

var prev_velocity := Vector3.ZERO

var examining := false
var enable_keyboard_look := false

func _ready() -> void:
	GlobalEvents.player_entered_speed_boost_area.connect(player_entered_speed_boost_area)
	GlobalEvents.player_left_speed_boost_area.connect(player_left_speed_boost_area)

func player_entered_speed_boost_area():
	SPEED = 60
	
func player_left_speed_boost_area():
	SPEED = 60

func _physics_process(delta: float) -> void:
	camera_move(delta)
	
	if examining:
		return

	
	var input_dir := GlobalInput.keyboard_vector()
	
	var direction: Vector3 = (camera_rot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		char_body.velocity.x = direction.x * SPEED
		char_body.velocity.z = direction.z * SPEED
	else:
		char_body.velocity.x = move_toward(char_body.velocity.x, 0, SPEED)
		char_body.velocity.z = move_toward(char_body.velocity.z, 0, SPEED)
	char_body.velocity.y = char_body.get_gravity().y
	prev_velocity = char_body.velocity
	char_body.move_and_slide()
	
	if char_body.velocity.x != 0 or char_body.velocity.y != 0:
		if is_walking == false:
			wwise_walking_true.set_value()
		is_walking = true
	else:
		if is_walking == true:
			wwise_walking_false.set_value()
		is_walking = false

func _input(event: InputEvent) -> void:
	if not examining and event is InputEventMouseMotion:
		camera_move_event = event.relative * GlobalInput.MOUSE_SENSITIVITY

func camera_move(delta: float):
	var move := GlobalInput.camera_joystick() 
	if enable_keyboard_look and move == Vector2.ZERO:
		move = GlobalInput.keyboard_vector()
	if not examining and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and move == Vector2.ZERO:
		move = camera_move_event
	camera_move_event = Vector2.ZERO
	camera.global_rotation.x -= move.y*delta
	camera.global_rotation.x = clampf(camera.global_rotation.x, -1.0, 1.0)
	camera_rot.global_rotation.y -= move.x*delta
