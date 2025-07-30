extends Node2D
signal finish_game

var game_settings = preload("res://game_setting/game_setting.tres")
@export var Furnitures: Dictionary = {
	"Chai": preload("res://Scenes/AssetScenes/chair.tscn"),
	"Clos": preload("res://Scenes/AssetScenes/closet.tscn"),
	"DoBe": preload("res://Scenes/AssetScenes/double_bed.tscn"),
	"Plan": preload("res://Scenes/AssetScenes/plant_1.tscn"),
	"SpPl": preload("res://Scenes/AssetScenes/plant_2.tscn"),
	"ReTa": preload("res://Scenes/AssetScenes/rec_table.tscn"),
	"RoTa": preload("res://Scenes/AssetScenes/round_table.tscn"),
	"Seat": preload("res://Scenes/AssetScenes/seat.tscn"),
	"SiBe": preload("res://Scenes/AssetScenes/single_bed.tscn"),
	"Sofa": preload("res://Scenes/AssetScenes/sofa.tscn"),
	"TeVi": preload("res://Scenes/AssetScenes/tv.tscn"),
	"WeCh": preload("res://Scenes/AssetScenes/weird_chair.tscn")
	}

#================================================================#
#	Plans for test level:
#		- first look at the table
#		- then solve the riddle to search the correct chair
#		- then look in closet
#		- find the plant that looks different
#		- finish
#
#================================================================#

#============================#
#
# width:  1152
# length: 648
#
#============================#

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect_signals()
	set_up_level(game_settings.level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_settings.event_num == game_settings.special_events.size()-1 and game_settings.curr_state == game_settings.STATES.PLAYING:
		finish_game.emit()
		$Player.interactable = false
		$Player.movable = false
		game_settings.curr_state = game_settings.STATES.FINISHED
	
func connect_signals():
	#for child_node in $Map/Furnitures.get_children():
		#child_node.player = $Player
		#child_node.connect_signal()
	$Dialogue.done_dia.connect(Callable($Player, "_return_from_dia"))
	connect("finish_game", Callable($EndScreen, "_play_animation"))
	
func set_up_level(level):
	for key in game_settings.level1_layout:
		#pass
		var curr_furniture:Node2D = Furnitures[key.substr(0, 4)].instantiate()
		
		#print(key)
		#for info in game_settings.level1_layout[key]:
			#print(info)
		#print()
		
		curr_furniture.furniture_name = key
		curr_furniture.set_location(game_settings.level1_layout[key][0], game_settings.level1_layout[key][1])
		for line in game_settings.level1_layout[key][2]:
			curr_furniture.special_lines.append(line)
		curr_furniture.player = $Player
		curr_furniture.connect_signal()
		
		curr_furniture.add_to_group("furnitures")
		$Map/Furnitures.add_child(curr_furniture)
	
	
	
