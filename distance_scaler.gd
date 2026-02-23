extends Node

@export var body_a: CharacterBody3D
@export var body_b: CharacterBody3D

@export var wwise_intensity: WwiseRTPC

@export var max_distance: float = 500.0

var scaled_distance: float = 0.0


func _process(_delta: float) -> void:

	var raw_distance: float = body_a.global_position.distance_to(body_b.global_position)
	scaled_distance = _scale_to_100(raw_distance)
	wwise_intensity.set_global_value(100 - scaled_distance)

func _scale_to_100(value: float) -> float:
	return clamp((value / max_distance) * 100.0, 0.0, 100.0)
