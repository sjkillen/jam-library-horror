@tool
extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_child()



func make_child():
	if get_children().size() != 0:
		return
	var path := Path3D.new()
	path.curve = Curve3D.new()
	var mdt := MeshDataTool.new()
	mdt.create_from_surface(mesh, 0)

	var points := []
	var prev = Vector3(-9999, -999, -9999)

	for i in range(mdt.get_vertex_count()):
		var v = mdt.get_vertex(i)
		if v.y > 50.:
			continue
		points.append(v)
	
	for v in points:
		if (prev - v).length() > .01:
			path.curve.add_point(v)
		prev = v
	
	
	add_child(path)
	path.owner = owner
