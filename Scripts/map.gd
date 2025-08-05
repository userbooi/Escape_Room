extends Node2D

var game_settings = preload("res://game_setting/game_setting.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_padding()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_base(level):
	for child in get_children().slice(0, 2):
		if child.name == "Level" + str(level):
			child.visible = true
			child.get_child(1).collision_enabled = true
		else:
			child.visible = false
			child.get_child(1).collision_enabled = false
			
func hide_padding():
	for node in get_children().slice(3, 7):
		node.visible = false

func show_padding() -> void:
	for node in get_children().slice(3, 7):
		node.visible = true
	
func set_padding(room, level):
	print(level)
	$LeftPad.position = Vector2(game_settings.levels_camera_limit[level-1][room][0]-721, game_settings.levels_camera_limit[level-1][room][1]-309)
	$RightPad.position = Vector2(game_settings.levels_camera_limit[level-1][room][2], game_settings.levels_camera_limit[level-1][room][1]-309)
	$TopPad.position = Vector2(game_settings.levels_camera_limit[level-1][room][0]-374, game_settings.levels_camera_limit[level-1][room][1]-647)
	$BottomPad.position = Vector2(game_settings.levels_camera_limit[level-1][room][0]-374, game_settings.levels_camera_limit[level-1][room][3])
	show_padding()
	print($LeftPad.position)
	print($RightPad.position)
