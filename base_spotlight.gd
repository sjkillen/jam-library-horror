extends SpotLight3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if randi_range(0, 100) == 99:
		blink()
	
	
func blink():
	visible = not visible
	await get_tree().create_timer(.1).timeout
	visible = not visible
	await get_tree().create_timer(.1).timeout
	visible = not visible
	await get_tree().create_timer(.1).timeout
	visible = true
