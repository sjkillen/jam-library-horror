extends CharacterBody3D

var SPEED: float = 10.

@export var player: Player
@export var path: Path3D

var sleeping = false

func _ready() -> void:
	while true:
		await get_tree().create_timer(30).timeout
		sleeping = not sleeping


func _physics_process(_delta: float) -> void:
	if sleeping:
		return
	var dest: Vector3 = player.global_position + Vector3(randi_range(3, 6), randi_range(3, 6), randi_range(3, 6))
	GlobalBooks.monster_pos = global_position
	velocity = (dest - global_position)
	
	velocity = velocity.normalized() * SPEED
	#velocity.y = get_gravity().y
	move_and_slide()


#func follow_player() -> Vector3:
	#$NavigationAgent3D.target_position = player.global_position
	#return $NavigationAgent3D.get_next_path_position() 
	
	#return player.global_position + Vector3(randi_range(3, 6), randi_range(3, 6), randi_range(3, 6))
	


func walk_path(delta: float) -> Vector3:
	#var p := path.curve.get_closest_point(global_position)
	#if (global_position - p).length() > 0.1:
		#return p
	
	var follow: PathFollow3D = path.get_child(0)
	#if (global_position - follow.global_position).length() < SPEED * delta * 3.:
	follow.progress += SPEED * delta
	
	return follow.global_position
	#var o := path.curve.get_closest_offset(p)
	#var length := path.curve.get_baked_length()
	#
	#if o + walking_dir > length:
		#walking_dir *= -1.
	#
	#return path.curve.sample_baked(o + walking_dir)
