extends CharacterBody3D
class_name Player


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if %Movement.examining:
			%Movement.examining = false
			%HandheldBook.unequip()
			%Movement.enable_keyboard_look = false
		else:
			%Movement.examining = true
			%HandheldBook.equip()
			await GlobalInput.move_neutral
			if %Movement.examining:
				%Movement.enable_keyboard_look = true
