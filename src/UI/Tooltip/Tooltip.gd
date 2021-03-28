extends Node
class_name Tooltip

export var visuals : PackedScene
export var owner_path : NodePath
export (float, 0, 10, 0.05) var delay = 0.5
export var follow_mouse : bool = true
export (float, 0, 100, 1) var offset_x
export (float, -100, 100, 1) var offset_y
export var is_above_mouse : bool = false

onready var owner_node = get_node(owner_path)
onready var offset:Vector2 = Vector2(offset_x, offset_y)
onready var extents


var _container:Node
var _visuals:Control
var _timer:Timer


func _ready():
	_visuals = visuals.instance()
	add_child(_visuals)
	_visuals.hide()
	
	_container = _visuals.get_node("Container")
	
	extents = _visuals.rect_size
	
	owner_node.connect("mouse_entered", self, "_on_mouse_entered")
	owner_node.connect("mouse_exited", self, "_on_mouse_exited")
	
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_timer_timeout")


func _process(delta):
	if _visuals.visible:
		var base_pos = _get_screen_position()
		var final_x = base_pos.x + offset.x
		var final_y = base_pos.y - offset.y
		
		if is_above_mouse:
			final_y -= extents.y
		
		_visuals.rect_position = Vector2(final_x, final_y)


func set_text(texts:Dictionary) -> void:
	for text in texts:
		var child:Label = _container.find_node(text)
		if child:
			child.text = texts[text] 


func _get_screen_position() -> Vector2:
	if follow_mouse:
		return get_viewport().get_mouse_position()
	
	var pos = Vector2.ZERO
	
	if owner_node is Node2D:
		pos = owner_node.global_position
	
	return pos


func _on_timer_timeout() -> void:
	_timer.stop()
	_visuals.show()


func _on_mouse_entered() -> void:
	_timer.start(delay)


func _on_mouse_exited() -> void:
	_timer.stop()
	_visuals.hide()
