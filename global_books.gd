extends Node3D

@export var story: Array[BookChain]
var books: Array[ClosedBook] = []

var monster_pos := Vector3.ZERO

func _ready() -> void:
	var first = story.pop_at(0)
	story.shuffle()
	story.push_front(first)

func register_book(cb: ClosedBook):
	if not cb.tracked:
		books.append(cb)

func get_next() -> BookData:
	if story.size() == 0 or (story.size() == 1 and story[0].book.size() == 0):
		get_tree().change_scene_to_file("res://ending.tscn")
		return
	if story[0].book.size() == 0:
		story.pop_at(0)
	var bd: BookData = story[0].book.pop_at(0)
	if bd.effect:
		add_child(bd.effect.instantiate())
	return bd
		
func finish():
	books.shuffle()
	books.pop_at(0).track()
	books.pop_at(0).track()
	books.pop_at(0).track()
	books.pop_at(0).track()
	books.pop_at(0).track()
	books.pop_at(0).track()
