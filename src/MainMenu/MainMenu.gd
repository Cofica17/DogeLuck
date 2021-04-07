extends CanvasLayer


onready var qr_code := $QrCode
onready var text_code := $TextCode


func _ready():
	PlatformServer.connect("qr_code_fetched", self, "_on_qr_code_fetched")
	PlatformServer.connect("text_code_fetched", self, "_on_text_code_fetched")


func _on_qr_code_fetched(img:Image) -> void:
	var texture = ImageTexture.new()
	texture.create_from_image(img)
	qr_code.texture = texture


func _on_text_code_fetched(code:String) -> void:
	text_code.text = code


func _on_Button_pressed():
	Scenes.start_main_menu_scene()
