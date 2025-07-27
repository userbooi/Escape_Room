extends Node2D
signal interact

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interact_area_area_entered(area: Area2D) -> void:
	if area.name == "PlayerInteractArea":
		interact.emit()
	#print($interactArea.get_overlapping_areas()[0].name)
