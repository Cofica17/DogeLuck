extends Node


onready var RacingActivityScene = preload("res://src/Main/Activities/RacingActivity/RacingActivity.tscn")


func _ready():
	pass


func start_racing_activity_scene() -> void:
	get_tree().change_scene(RacingActivityScene.resource_path)
