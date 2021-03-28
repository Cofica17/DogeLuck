extends KinematicEntity
class_name Dog

var traits:Traits


func _on_target_moved(dir:Vector2) -> void:
	_move(dir)
	_set_animation(dir)


func _on_new_rotation_set() -> void:
	var point = Global.player.position
	var new_pos:Vector2 = point + (position - point).rotated(deg2rad(rotation_angle - prevoious_rotation_angle))
	position = new_pos


func set_traits(new_traits:Traits) -> void:
	traits = new_traits


func _on_clicked() -> void:
	print("dog clicked")