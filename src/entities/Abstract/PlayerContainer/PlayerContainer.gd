extends Node

var dog : Dog
var player : Player


func _ready():
	player = find_node("Player")
	Global.player = player
