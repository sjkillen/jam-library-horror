extends Node3D
class_name ClosedBook

var player = weakref(null)

@export var tracked := false

var tween: Tween = null
var w = 0.0

@onready var playback: AnimationNodeStateMachinePlayback = %AnimationTree.get("parameters/playback")

func _ready() -> void:
	GlobalBooks.register_book(self)
	$book.process_mode = Node.PROCESS_MODE_DISABLED
	if tracked:
		track()
	
func track():
	$book.process_mode = Node.PROCESS_MODE_ALWAYS
	tracked = true

func attach_to_player(p: Player):
	player = weakref(p)
	tween = create_tween()
	tween.tween_property(self, "w", 1.0, 1.0)
	

func _process(_delta: float) -> void:
	var p = player.get_ref()
	if p is not Player:
		$book/Mesh_0_002.set_instance_shader_parameter("tracked", tracked)
		return
	$book/Mesh_0_002.set_instance_shader_parameter("tracked", false)
	global_position = lerp(global_position, p.get_attach_point(), w)
	global_rotation = lerp(global_rotation, p.get_attach_rot(), w)
	#scale = lerp(scale, p.get_attach_scale(), w)
	if GlobalInput.keyboard_vector() != Vector2.ZERO:
		playback.travel("bobble")
	else:
		playback.travel("RESET")
	
	
