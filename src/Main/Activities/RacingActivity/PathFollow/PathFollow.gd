extends PathFollow2D

export var speed := 200.0

func _process(delta):
	var dog = get_child(0)
	dog.set_previous_global_position(dog.global_position)
	set_offset(get_offset() + speed * delta)
	dog.set_animation(dog.get_direction())
