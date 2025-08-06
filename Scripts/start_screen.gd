extends Control
signal select_levels

var game_settings = preload("res://game_setting/game_setting.tres")
var scroll_speed = 200.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background/AnimatedSprite2D.play("Walk")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_settings.curr_state == game_settings.STATES.START:
		scroll_background(delta)

func _on_start_button_pressed() -> void:
	select_levels.emit()
	
func vis() -> void:
	visible = true
	self_modulate.a = 1

func invis():
	visible = false
	self_modulate.a = 0
	
func scroll_background(delta: float) -> void:
	$Background/Background.position.y -= scroll_speed * delta
	if $Background/Background.position.y < -640:
		$Background/Background.position = Vector2.ZERO
