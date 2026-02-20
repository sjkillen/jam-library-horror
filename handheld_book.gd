extends Node3D

@export var max_x: float
@export var min_y: float
@export var max_y: float
@export var max_rotate: float
@export var move_speed: float

var enabled := false

func _ready() -> void:
	%book.visible = false

func _input(event: InputEvent) -> void:
	if not enabled:
		return
	if event is InputEventMouseMotion:
		move_book(event.relative)


func _process(delta: float) -> void:
	var joy := GlobalInput.move_joystick() * 600. * delta
	move_book(joy)
		

func move_book(where: Vector2):
	if not enabled:
		return
	where *= move_speed * 0.1
	position.x = clamp(position.x + where.x, -max_x, max_x)
	position.y = clamp(position.y - where.y, min_y, max_y)
	var w := (position.y - min_y) / (max_y - min_y)
	rotation.x = lerp(-max_rotate, 0.0, w)

func equip():
	enabled = true
	%AnimationPlayer.play("equip")

func unequip():
	enabled = false
	%AnimationPlayer.play_backwards("equip")
