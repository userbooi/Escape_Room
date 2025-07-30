extends Node2D

@export var furniture_name: String
@export var player: CharacterBody2D

@export var normal_lines: Array[String]
@export var special_lines: Array[String]

var game_settings = preload("res://game_setting/game_setting.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func connect_signal():
	player.connect("interact", Callable(self, "_init_dia"))

func _init_dia(interacting_object, trigger_event):
	if furniture_name == interacting_object:
		if trigger_event:
			get_parent().get_parent().get_node("../Dialogue").set_lines(special_lines)
			game_settings.found = true
		else:
			get_parent().get_parent().get_node("../Dialogue").set_lines(normal_lines)

#func _on_interact_area_area_entered(area: Area2D) -> void:
	#if area.name == "PlayerInteractArea":
		#interact.emit()
	##print($interactArea.get_overlapping_areas()[0].name)
#
#func _on_interact_area_area_exited(area: Area2D) -> void:
	#if area.name == "PlayerInteractArea":
		#exit_interact.emit()
