extends CanvasLayer

func _ready() -> void:
	visible = false

func _on_handheld_book_reading() -> void:
	visible = true

func _on_handheld_book_unreading() -> void:
	visible = false
