extends Node3D

@export var max_x: float
@export var bounds_y: Vector2
@export var move_speed: float

var enabled := false

func _ready() -> void:
	%MeshInstance3D.visible = false

func _input(event: InputEvent) -> void:
	if not enabled:
		return
	if event is InputEventMouseMotion:
		move_book(event.relative)


func _process(delta: float) -> void:
	var joy := GlobalInput.move_joystick() * 600. * delta
	move_book(joy)
		

func move_book(where: Vector2):
	where *= move_speed * 0.1
	where.y *= -1.
	position += Vector3(where.x, where.y, 0.0)
	position.x = clamp(position.x, -max_x, max_x)
	position.y = clamp(position.y, -bounds_y.y, bounds_y.x)

func equip():
	enabled = true
	%AnimationPlayer.play("equip")

func unequip():
	enabled = false
	%AnimationPlayer.play_backwards("equip")
