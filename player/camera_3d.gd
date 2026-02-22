extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (GlobalBooks.monster_pos - global_position).length() < 100.:
		var scale = 0.5
		position = Vector3((randf()-.5)*scale,(randf()-.5)*scale,(randf()-.5)*scale)
