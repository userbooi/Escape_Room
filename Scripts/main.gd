extends Node2D
signal finish_game

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

var special_events = ["t", "ss", "clo", "sp"]
var event_num = 0
var found = false

enum STATES {PLAYING, DIALOGUE, FINISHED}
var curr_state = STATES.PLAYING

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect_signals()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if event_num == special_events.size()-1 and curr_state == STATES.PLAYING:
		finish_game.emit()
		$Player.interactable = false
		$Player.movable = false
		curr_state = STATES.FINISHED
	
func connect_signals():
	for child_node in $Map/Furnitures.get_children():
		child_node.player = $Player
		child_node.connect_signal()
	$Dialogue.done_dia.connect(Callable($Player, "_return_from_dia"))
	connect("finish_game", Callable($EndScreen, "_play_animation"))
	
	
	
