extends Node

onready var first_starting_position = get_node("RacingStartPoints/First")
onready var second_starting_position = get_node("RacingStartPoints/Second")
onready var third_starting_position = get_node("RacingStartPoints/Third")
onready var fourth_starting_position = get_node("RacingStartPoints/Fourth")
onready var dogs_container = get_node("DogsContainer")


func _ready():
	#DEBUG
	_add_start_dog(first_starting_position.position)
	_add_start_dog(second_starting_position.position)


func _add_start_dog(pos) -> void:
	var _Dog = load("res://src/entities/Dog/Dog.tscn")
	var dog = _Dog.instance()
	add_dog(dog)
	
	dog.position = pos - Vector2(0,-20)
	var body = dog.get_node("Body")
	body.animation = "Side"
	body.set_flip_h(true)
	dog.move_towards_player = false
	
	var traits = Traits.new()
	traits.set_traits(["Stuborn", "Playful", "Energetic"])
	dog.set_traits(traits)


func add_dog(_dog:KinematicEntity) -> void:
	var dog = _dog
	dogs_container.add_child(_dog)
