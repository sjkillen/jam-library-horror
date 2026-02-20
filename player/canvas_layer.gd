extends CanvasLayer

func _ready() -> void:
	visible = false

func _on_handheld_book_reading() -> void:
	print("foo")
	visible = true

func _on_handheld_book_unreading() -> void:
	print("bar")
	visible = false
