extends CharacterBody3D

var SPEED: float = 100000

@export var player: Player
@export var path: Path3D

func _physics_process(delta: float) -> void:
	var dest := walk_path(delta)
	velocity = (dest - global_position).normalized() 
	print(velocity)
	move_and_slide()


func follow_player() -> Vector3:
	$NavigationAgent3D.target_position = player.global_position
	return $NavigationAgent3D.get_next_path_position() 
	


var walking_dir := -5.
func walk_path(delta: float) -> Vector3:
	#var p := path.curve.get_closest_point(global_position)
	#if (global_position - p).length() > 0.1:
		#return p
	
	var follow: PathFollow3D = path.get_child(0)
	if (global_position - follow.global_position).length() < SPEED * delta * 3.:
		follow.progress += SPEED * delta
	
	return follow.global_position
	#var o := path.curve.get_closest_offset(p)
	#var length := path.curve.get_baked_length()
	#
	#if o + walking_dir > length:
		#walking_dir *= -1.
	#
	#return path.curve.sample_baked(o + walking_dir)
