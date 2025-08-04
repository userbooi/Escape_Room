extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_base(level):
	for child in get_children():
		if child.name == "Furnitures":
			pass
		elif child.name == "Level" + str(level):
			child.visible = true
			child.get_child(1).collision_enabled = true
		else:
			child.visible = false
			child.get_child(1).collision_enabled = false
