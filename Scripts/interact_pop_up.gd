extends Control

@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = Vector2(player.position.x+10, player.position.y-110)
	
func set_text(new_text):
	$GridContainer/PopUpPrompt.text = new_text

func get_text() -> String:
	return $GridContainer/PopUpPrompt.text
	
