extends Node2D

@export var furniture_name: String
@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(get_parent().get_parent().get_node("../Dialogue").name)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func connect_signal():
	player.connect("interact", Callable(self, "_do_something"))

func _do_something(interacting_object):
	if furniture_name == interacting_object:
		get_parent().get_parent().get_node("../Dialogue").set_lines(["hello", "next", "wow", "last"])

#func _on_interact_area_area_entered(area: Area2D) -> void:
	#if area.name == "PlayerInteractArea":
		#interact.emit()
	##print($interactArea.get_overlapping_areas()[0].name)
#
#func _on_interact_area_area_exited(area: Area2D) -> void:
	#if area.name == "PlayerInteractArea":
		#exit_interact.emit()
