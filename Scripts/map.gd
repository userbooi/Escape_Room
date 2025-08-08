extends Node2D

var game_settings = preload("res://game_setting/game_setting.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_padding()
	for node in get_child(3).get_children():
		print(node.position, node.rotation)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_base(level):
	for child in get_children().slice(0, 3):
		if child.name == "Level" + str(level):
			child.visible = true
			child.get_child(1).collision_enabled = true
		else:
			child.visible = false
			child.get_child(1).collision_enabled = false
			
func hide_padding():
	for node in get_children().slice(4, 8):
		node.visible = false

func show_padding() -> void:
	for node in get_children().slice(4, 8):
		node.visible = true
	
func set_padding(room, level):
	var left = game_settings.levels_camera_limit[level-1][room][0]
	var top = game_settings.levels_camera_limit[level-1][room][1]
	var right = game_settings.levels_camera_limit[level-1][room][2]
	var bottom = game_settings.levels_camera_limit[level-1][room][3]
	
	var room_height = bottom - top
	var room_width = right - left
	
	$LeftPad.position = Vector2(left-721, top-(3292 - room_height)/2)
	$RightPad.position = Vector2(right, top-(3292 - room_height)/2)
	$TopPad.position = Vector2(left-(1900 - room_width)/2, top-647)
	$BottomPad.position = Vector2(left-(1900 - room_width)/2, bottom)
	show_padding()
