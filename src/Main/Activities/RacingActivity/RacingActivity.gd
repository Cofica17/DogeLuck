extends Node

onready var first_starting_position = get_node("Road/RacingStartPoints/First")
onready var second_starting_position = get_node("Road/RacingStartPoints/Second")
onready var third_starting_position = get_node("Road/RacingStartPoints/Third")
onready var fourth_starting_position = get_node("Road/RacingStartPoints/Fourth")

onready var first_dog_container = get_node("Road/RacingStartPoints/First/Path2D/PathFollow2D")


func _ready():
	#DEBUG
	_add_start_dog(first_starting_position.global_position, first_dog_container)
	#_add_start_dog(second_starting_position.position)


func _add_start_dog(pos, parent) -> void:
	var _Dog = load("res://src/entities/Dog/Dog.tscn")
	var dog = _Dog.instance()
	add_dog(dog, parent)
	
#	dog.global_position = pos
	var body = dog.get_node("Body")
	body.animation = "Side"
	body.set_flip_h(true)
	dog.move_towards_player = false
	
	var traits = Traits.new()
	traits.set_traits(["Stuborn", "Playful", "Energetic"])
	dog.set_traits(traits)


func add_dog(_dog:KinematicEntity, parent) -> void:
	var dog = _dog
	parent.add_child(_dog)
