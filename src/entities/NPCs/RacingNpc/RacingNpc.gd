extends Npc


func _ready():
	pass


func _trigger_player_interaction() -> void:
	Scenes.start_racing_activity_scene()
