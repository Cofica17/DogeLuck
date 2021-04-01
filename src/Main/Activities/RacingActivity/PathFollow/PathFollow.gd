extends PathFollow2D

var speed := 200.0

func _process(delta):
	set_offset(get_offset() + speed * delta)
	var dog = get_child(0)
	if dog:
		dog._set_animation(dog.position.normalized())
