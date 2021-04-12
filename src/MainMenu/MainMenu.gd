extends CanvasLayer


onready var qr_code := $VBoxContainer/QrCode
onready var text_code := $VBoxContainer2/TextCode
onready var player_name := $PlayerName
onready var play_btn := $Play
onready var select_btn := $Select
onready var unlink_btn := $Unlink


func _ready():
	PlatformServer.connect("qr_code_fetched", self, "_on_qr_code_fetched")
	PlatformServer.connect("text_code_fetched", self, "_on_text_code_fetched")
	play_btn.connect("pressed", self, "_on_play_btn_pressed")
	select_btn.connect("pressed", self, "_on_select_btn_pressed")
	unlink_btn.connect("pressed", self, "_on_unlink_btn_pressed")


func _on_qr_code_fetched(img:Image) -> void:
	var texture = ImageTexture.new()
	texture.create_from_image(img)
	qr_code.texture = texture


func _on_text_code_fetched(code:String) -> void:
	text_code.text = code


func _on_unlink_btn_pressed() -> void:
	PlatformServer.unlink_player()


func _on_play_btn_pressed() -> void:
	Scenes.start_main_menu_scene()


func _on_select_btn_pressed() -> void:
	#TODO: need a check if app is authenticated
	print(player_name.text)
	#PlatformServer.create_player(player_name.text, 1)
	Global.player_name = player_name.text
	PlatformServer.auth_player(player_name.text, 1)
