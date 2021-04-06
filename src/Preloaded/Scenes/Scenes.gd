extends Node

onready var RacingActivityScene = preload("res://src/Main/Activities/RacingActivity/RacingActivity.tscn")

onready var DogScene = preload("res://src/entities/Dog/Dog.tscn")


func _ready():
	pass


func get_dog_instance() -> Dog:
	return DogScene.instance()


func start_racing_activity_scene() -> void:
	get_tree().change_scene(RacingActivityScene.resource_path)

