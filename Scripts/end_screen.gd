extends Control
signal back_to_start

@export var player: CharacterBody2D
var camera

var x_coord
var y_coord

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	invis()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera = player.get_node("./Camera2D")
	x_coord = camera.get_screen_center_position().x-get_viewport_rect().size.x/2
	y_coord = camera.get_screen_center_position().y-get_viewport_rect().size.y/2
	
	position = Vector2(x_coord, y_coord)

func _play_animation() -> void:
	visible = true
	$AnimationPlayer.play("endGame")
	await get_tree().create_timer(1.75).timeout
	
func invis():
	visible = false
	$ColorRect.self_modulate.a = 0
	$Label.self_modulate.a = 0
	$Button.visible = false


func _on_button_pressed() -> void:
	back_to_start.emit(false)
