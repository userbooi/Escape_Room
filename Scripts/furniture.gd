extends Node2D
signal move


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

func set_location(pos, rot):
	position = pos
	rotation = rot

func connect_signal():
	if "Door" not in furniture_name:
		player.connect("interact", Callable(self, "_init_dia"))
	else:
		player.connect("interact", Callable(self, "_move_rooms"))

func _init_dia(interacting_object, trigger_event):
	if furniture_name == interacting_object:
		if trigger_event:
			get_parent().get_parent().get_node("../Dialogue").set_lines(special_lines)
			game_settings.found = true
		else:
			get_parent().get_parent().get_node("../Dialogue").set_lines(normal_lines)
			
func _move_rooms(interacting_object, trigger_event) -> void:
	if furniture_name == interacting_object:
		# curr_room, new_room, curr_level, door
		move.emit(game_settings.curr_room, 
				  game_settings.levels_room_connections[game_settings.curr_level-1][game_settings.curr_room][furniture_name][0],
				  game_settings.curr_level,
				  furniture_name)
