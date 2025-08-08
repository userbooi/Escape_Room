extends Control
signal done_dia

@export var player: CharacterBody2D

var camera: Camera2D
var x_coord: int
var y_coord: int

var lines: Array
var line_index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	$Panel/NinePatchRect/RichTextLabel.bbcode_enabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera = player.get_node("./Camera2D")
	x_coord = camera.get_screen_center_position().x-get_viewport_rect().size.x/2
	y_coord = camera.get_screen_center_position().y-get_viewport_rect().size.y/2
	
	position = Vector2(x_coord, y_coord)

func _on_continue_button_pressed() -> void:
	if line_index != lines.size()-1:
		line_index += 1
		assign_line()
	else:
		done_dia.emit()
		visible = false
	
func set_lines(new_lines):
	lines = new_lines
	line_index = 0
	assign_line()

func assign_line():
	$Panel/NinePatchRect/RichTextLabel.clear()
	var real_text = lines[line_index].replace("[br]", "\n\n")
	real_text = real_text.replace("[n]", "\n")
	$Panel/NinePatchRect/RichTextLabel.append_text(real_text)
