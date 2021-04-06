extends KinematicEntity
class_name Player


func _physics_process(delta):
	var dir = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	var move = dir.normalized() * speed
	_move(move)
	
	set_animation(dir)
