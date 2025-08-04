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
	#$Player.disable()
	#set_up_UI()
	
	set_up_level(game_settings.level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_settings.event_num == game_settings.special_events.size()-1 and game_settings.curr_state == game_settings.STATES.PLAYING:
		finish_game.emit()
		$Player.interactable = false
		$Player.movable = false
		game_settings.curr_state = game_settings.STATES.FINISHED
	
func connect_signals():
	$Dialogue.done_dia.connect(Callable($Player, "_return_from_dia"))
	connect("finish_game", Callable($EndScreen, "_play_animation"))
	$StartScreen.connect("select_levels", Callable(self, "_transition_to_levels"))
	$EndScreen.connect("back_to_start", Callable(self, "_transition_to_start"))
	for node in $LevelSelect.get_children():
		if "Level" in node.name:
			node.connect("load_level", Callable(self, "_transition_to_play"))
	
func set_up_level(level):
	$Player.reset_pos()
	$Map.set_base(level)
	for key in game_settings.levels_layout[level-1]:
		var curr_furniture:Node2D = Furnitures[key.substr(0, 4)].instantiate()
		
		curr_furniture.furniture_name = key
		curr_furniture.set_location(game_settings.levels_layout[level-1][key][0], game_settings.levels_layout[level-1][key][1])
		for line in game_settings.levels_layout[level-1][key][2]:
			curr_furniture.special_lines.append(line)
		curr_furniture.player = $Player
		curr_furniture.connect_signal()
		
		curr_furniture.add_to_group("furnitures")
		$Map/Furnitures.add_child(curr_furniture)
	$Player.set_camera_limits("Bedroom", level)
	set_up_UI()
		
func set_up_UI():
	$EndScreen.invis()
	$StartScreen.invis()
	$LevelSelect.invis()
	if game_settings.curr_state == game_settings.STATES.START:
		$StartScreen.vis()
	elif game_settings.curr_state == game_settings.STATES.LEVEL_SELECT:
		$LevelSelect.vis()
		
func _transition_to_levels():
	game_settings.curr_state = game_settings.STATES.LEVEL_SELECT
	$AnimationPlayer.play("transition_in")
	await get_tree().create_timer(0.25).timeout
	set_up_UI()
	$AnimationPlayer.play("transition_out")
	await get_tree().create_timer(0.25).timeout
	$LevelSelect.show_buttons()
	
func _transition_to_play(level):
	game_settings.curr_state = game_settings.STATES.PLAYING
	$AnimationPlayer.play("transition_in")
	await get_tree().create_timer(0.25).timeout
	set_up_level(level)
	$Player.enable()
	$AnimationPlayer.play("transition_out")
	await get_tree().create_timer(0.25).timeout
	
func _transition_to_start():
	game_settings.level += 1
	for child in get_tree().get_nodes_in_group("furnitures"):
		child.remove_from_group("furnitures")
		child.queue_free()
	game_settings.curr_state = game_settings.STATES.START
	$AnimationPlayer.play("transition_in")
	await get_tree().create_timer(0.25).timeout
	$Player.disable()
	set_up_UI()
	$AnimationPlayer.play("transition_out")
	await get_tree().create_timer(0.25).timeout
	
