extends KinematicEntity
class_name Dog

export var distance_unil_movement : float = 180
export var stopping_distance : float = 50

var traits:Traits

onready var tooltip = get_node("Tooltip")

var is_moving = false


func _ready():
	pass


func _physics_process(delta):
	var distance_to_player = _get_distance_to_player()
	if distance_to_player >= distance_unil_movement or is_moving:
		_move_towards_player()
		is_moving = true
	
	if distance_to_player <= stopping_distance:
		_set_animation(Vector2.ZERO)
		is_moving = false


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


func _move_towards_player() -> void:
	var dir : Vector2 = Global.player.position - position
	var move = dir.normalized() * speed
	_move(move)
	_set_animation(dir)


func _get_distance_to_player() -> float:
	return position.distance_to(Global.player.position)
