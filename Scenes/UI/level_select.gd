extends Control

var game_settings = preload("res://game_setting/game_setting.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func invis():
	visible = false
	for node in get_children():
		if node.name != "AnimationPlayer":
			node.self_modulate.a = 0
		if "Level" in node.name:
			node.disabled = true
		
func vis():
	visible = true
	$TextureRect.self_modulate.a = 1
	$Label.self_modulate.a = 1
	
func show_buttons() -> void:
	$AnimationPlayer.play("show_buttons")
	await get_tree().create_timer(1).timeout
	$Level1.enable_level_buttons(game_settings.level, game_settings.level_ready)
