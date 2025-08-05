extends Control

@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.position.y-200 > player.get_node("./Camera2D").limit_top:
		position = Vector2(player.position.x+15, player.position.y-110)
	else:
		position = Vector2(player.position.x+15, player.position.y+110)
	
	
func set_text(new_text):
	$GridContainer/PopUpPrompt.text = new_text

func get_text() -> String:
	return $GridContainer/PopUpPrompt.text
	
