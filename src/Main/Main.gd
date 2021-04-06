extends Node2D

func _ready():
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
	var dog = Scenes.get_dog_instance()
	add_dog(dog)
	
	var traits = Traits.new()
	traits.set_traits(["Stuborn", "Playful", "Energetic"])
	dog.set_traits(traits)


func add_dog(_dog:KinematicEntity) -> void:
	var dog = _dog
	add_child(_dog)
	_position_dog_beside_player(dog)


func _position_dog_beside_player(dog) -> void:
	dog.position = Global.player.position + Vector2(0,-80)
