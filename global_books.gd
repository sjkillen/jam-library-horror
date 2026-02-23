extends Node3D

@export var story: Array[BookChain]
var books: Array = []

var monster_pos := Vector3.ZERO

func _ready() -> void:
	var first = story.pop_at(0)
	story.shuffle()
	story.push_front(first)
	await get_tree().create_timer(3).timeout
	books.shuffle()
	track()
	track()
	track()
	track()
	track()
	track()
	track()

func register_book(cb: ClosedBook):
	if not cb.tracked:
		books.append(weakref(cb))

func get_next() -> BookData:
	if story.size() == 0 or (story.size() == 1 and story[0].book.size() == 0):
		get_tree().change_scene_to_file("res://ending.tscn")
		var bd := BookData.new()
		bd.title = ""
		bd.body = ""
		return bd
	if story[0].book.size() == 0:
		story.pop_at(0)
	var bd: BookData = story[0].book.pop_at(0)
	if bd.effect:
		add_child(bd.effect.instantiate())
	return bd

func track():
	if books.size() == 0:
		return
	var v = books.pop_at(0)
	while v.get_ref() == null:
		v = books.pop_at(0)
	v.get_ref().track()
	

func finish():
	books.shuffle()
	track()
