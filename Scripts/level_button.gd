extends Button
signal load_level

@export var level_num: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	disable_level_buttons()
	load_level.emit(level_num)
	
func disable_level_buttons() -> void:
	for node in get_parent().get_children():
		if "Level" in node.name:
			node.disabled = true
			
func enable_level_buttons(level, ready_array) -> void:
	for node in get_parent().get_children():
		if "Level" in node.name and level_num <= level and ready_array[level_num-1]:
			node.disabled = false
