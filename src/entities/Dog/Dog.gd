extends KinematicEntity
class_name Dog

var traits:Traits

onready var tooltip = get_node("Tooltip")


func _ready():
	pass


func _on_target_moved(dir:Vector2) -> void:
	_move(dir)
	_set_animation(dir)


func _on_new_rotation_set() -> void:
	var point = Global.player.position
	var new_pos:Vector2 = point + (position - point).rotated(deg2rad(rotation_angle - prevoious_rotation_angle))
	position = new_pos


func set_traits(new_traits:Traits) -> void:
	traits = new_traits
	set_tooltip_text()


func set_tooltip_text() -> void:
	var texts := {}
	var counter := 1
	
	for trait in traits.get_traits():
		texts["Trait"+str(counter)] = trait
		counter += 1
	
	tooltip.set_text(texts)
