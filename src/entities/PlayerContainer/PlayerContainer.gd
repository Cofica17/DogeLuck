extends Node

var dog : Dog
var player : Player


func _ready():
	player = find_node("Player")
	
	#DEBUG
	_add_start_dog()
	
	#DEBUG ADDING ANOTEHR DOG
#	var _Dog = load("res://src/entities/Dog/Dog.tscn")
#	var dog = _Dog.instance()
#	add_child(dog)
#	var traits = Traits.new()
#	traits.set_traits(["Stuborn", "Playful22", "Energetic"])
#	dog.set_traits(traits)


func _add_start_dog() -> void:
	var _Dog = load("res://src/entities/Dog/Dog.tscn")
	add_dog(_Dog.instance())
	var traits = Traits.new()
	traits.set_traits(["Stuborn", "Playful", "Energetic"])
	dog.set_traits(traits)


func add_dog(_dog:KinematicEntity) -> void:
	dog = _dog
	add_child(_dog)
	player.connect("on_moved", dog, "_on_target_moved")
	_position_dog_beside_player()


func _position_dog_beside_player() -> void:
	dog.position = player.position + Vector2(0,-80)
