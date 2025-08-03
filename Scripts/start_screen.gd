extends Control
signal select_levels

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background/AnimatedSprite2D.play("Walk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_button_pressed() -> void:
	select_levels.emit()
	
func vis() -> void:
	visible = true
	self_modulate.a = 1

func invis():
	visible = false
	self_modulate.a = 0
