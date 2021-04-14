extends CanvasLayer

export var hardcode_luka := false
export var hardcode_cofi := false

onready var qr_code := $LinkVBC/VBoxContainer/QrCodeTextureRect
onready var text_code := $LinkVBC/VBoxContainer2/TextCode
onready var player_name := $VBoxContainer3/PlayerNameEditLine
onready var play_btn := $PlayButton
onready var select_btn := $SelectButton
onready var link_btn := $LinkVBC/LinkButton
onready var link_container := $LinkVBC
onready var unlink_btn := $UnlinkButton


func _ready():
	link_container.visible = false
	unlink_btn.visible = false
	play_btn.visible = false
	
	PlatformServer.connect("qr_code_fetched", self, "_on_qr_code_fetched")
	PlatformServer.connect("text_code_fetched", self, "_on_text_code_fetched")
	PlatformServer.connect("wallet_linked", self, "_on_wallet_linked")
	play_btn.connect("pressed", self, "_on_play_btn_pressed")
	select_btn.connect("pressed", self, "_on_select_btn_pressed")
	unlink_btn.connect("pressed", self, "_on_unlink_btn_pressed")
	link_btn.connect("pressed", self, "_on_link_btn_pressed")
	
	if hardcode_luka:
		player_name.text = "Luka"
		_on_select_btn_pressed()
	elif hardcode_cofi:
		player_name.text = "Cofi"
		_on_select_btn_pressed()


func _on_link_btn_pressed() -> void:
	PlatformServer.get_user_identities()


func _on_wallet_linked() -> void:
	unlink_btn.visible = true
	play_btn.visible = true
	link_container.visible = false


func _on_qr_code_fetched(img:Image) -> void:
	var texture = ImageTexture.new()
	texture.create_from_image(img)
	qr_code.texture = texture


func _on_text_code_fetched(code:String) -> void:
	text_code.text = code
	link_container.visible = true


func _on_unlink_btn_pressed() -> void:
	PlatformServer.unlink_player()
	PlatformServer.get_user_identities()
	unlink_btn.visible = false
	play_btn.visible = false


func _on_play_btn_pressed() -> void:
	Scenes.start_main_menu_scene()


func _on_select_btn_pressed() -> void:
	#TODO: need a check if app is authenticated
	#PlatformServer.create_player(player_name.text, 1)
	Global.player_name = player_name.text
	PlatformServer.auth_player(player_name.text, 1)
	unlink_btn.visible = false
	play_btn.visible = false
