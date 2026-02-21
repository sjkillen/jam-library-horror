extends CanvasLayer

var words: Array[String] = []
var repeat := "(The document cites several others. You know where to look next)"

var read_text: String = ""

func _ready() -> void:
	visible = false

func _on_handheld_book_reading() -> void:
	if words.size() == 0 and read_text == "":
		init()
	visible = true
	if words.size() != 0:
		$WordTimer.start(0.2)

func _on_handheld_book_unreading() -> void:
	visible = false
	$WordTimer.stop()

func clear():
	words = []
	read_text = ""
	$Control/VBoxContainer/Label.text = read_text

func init():
	var bd: BookData = GlobalBooks.get_next()
	read_text = bd.title + "\n\n"
	$Control/VBoxContainer/Label.text = read_text
	var g := bd.body.split(" ", false)
	for i in range(g.size()):
		words.append(g[i])
	
func read() -> bool:
	if words.size() == 0:
		read_text += "\n\n" + repeat
		$Control/VBoxContainer/Label.text = read_text
		words = [repeat]
		return false
	if words.size() == 1 and words[0] == repeat:
		return true
	read_text += words.pop_at(0) + " "
	$Control/VBoxContainer/Label.text = read_text
	return true

signal finished_book

func _on_word_timer_timeout() -> void:
	if not read():
		finished_book.emit()
