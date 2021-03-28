extends KinematicBody2D
class_name KinematicEntity

signal on_moved

onready var body : AnimatedSprite = get_node("Body")

export var speed = 150

var rotation_angle = 0
var prevoious_rotation_angle = 0


func _move(dir:Vector2) -> void:
	move_and_slide(dir)
	_rotate(dir)
	emit_signal("on_moved", dir)


func _on_target_moved(dir:Vector2) -> void:
	pass


func _set_animation(dir:Vector2) -> void:
	if not body:
		return
	
	if dir.x < 0:
		body.set_animation("Side")
		body.set_flip_h(true)
	elif dir.x > 0:
		body.set_animation("Side")
		body.set_flip_h(false)
	elif dir.y > 0:
		body.set_animation("Down")
	elif dir.y < 0:
		body.set_animation("Up")
	else:
		body.set_animation("Idle")


func _rotate(dir:Vector2) -> void:
	var rot = 0
	
	if dir.x < 0:
		rot = 90
	elif dir.x > 0:
		rot = 270
	elif dir.y > 0:
		rot = 0
	elif dir.y < 0:
		rot = 180
	
	_set_new_rotation_angle(rot)


func _set_new_rotation_angle(new_rot:int) -> void:
	if not new_rot == rotation_angle:
		prevoious_rotation_angle = rotation_angle
		rotation_angle = new_rot
		_on_new_rotation_set()


func _on_new_rotation_set() -> void:
	pass


func _on_clicked() -> void:
	pass


func input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		_on_clicked()
