extends CharacterBody3D
class_name Player

func examine_object_start():
	%Movement.examining = true
	%HandheldBook.equip()

func examine_object_end():
	%Movement.examining = false
	%HandheldBook.unequip()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if %Movement.examining:
			examine_object_end()
		else:
			examine_object_start()
