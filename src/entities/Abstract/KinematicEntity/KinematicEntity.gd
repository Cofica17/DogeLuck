extends KinematicBody2D
class_name KinematicEntity

signal on_moved

onready var body : AnimatedSprite = get_node("Body")

export var speed = 180

var previous_global_position:Vector2


func _move(dir:Vector2) -> void:
	set_previous_global_position()
	move_and_slide(dir)


func get_direction() -> Vector2:
	return global_position - previous_global_position


func set_previous_global_position(new_pos:Vector2=global_position) -> void:
	previous_global_position = new_pos


func set_animation(dir:Vector2) -> void:
	if not body:
		return
	
	if dir.x < 0 and dir.x < dir.y:
		body.set_animation("Side")
		body.set_flip_h(true)
	elif dir.x > 0 and dir.x > dir.y:
		body.set_animation("Side")
		body.set_flip_h(false)
	elif dir.y > 0:
		body.set_animation("Down")
	elif dir.y < 0:
		body.set_animation("Up")
	else:
		body.set_animation("Idle")


func _on_clicked() -> void:
	pass


func input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		_on_clicked()
