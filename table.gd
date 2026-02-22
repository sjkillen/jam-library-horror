extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if randi_range(1, 16) != 15:
		GlobalBooks.books.remove_at(GlobalBooks.books.find(self))
		$ClosedBook.queue_free()
