extends Node
class_name Npc

onready var npc_info_text:Label = get_node("NpcInfoText")

export var info_text:String = "Press E to interact."

var player_nearby := false


func _ready():
	npc_info_text.text = info_text


func _on_Area2D_body_entered(body):
	if body is Player:
		_show_npc_info_text()
		player_nearby = true


func _show_npc_info_text() -> void:
	npc_info_text.visible = true


func _on_Area2D_body_exited(body):
	npc_info_text.visible = false
	player_nearby = false


func _toggle_activity_info_visibility() -> void:
	npc_info_text.visible = !npc_info_text.visible


func _trigger_player_interaction() -> void:
	pass


func _input(event):
	if Input.is_action_just_pressed("interact") and player_nearby:
		_trigger_player_interaction()
