extends Node

var dog : KinematicEntity
var player : KinematicEntity


func _ready():
	player = find_node("Player")
	
	#DEBUG
	var _Dog = load("res://src/Main/Dog/Dog.tscn")
	add_dog(_Dog.instance())



func add_dog(_dog:Dog) -> void:
	dog = _dog
	add_child(_dog)
	player.connect("on_moved", dog, "_on_target_moved")
	_position_dog_beside_player()


func _position_dog_beside_player() -> void:
	dog.position = player.position + Vector2(0,-80)
