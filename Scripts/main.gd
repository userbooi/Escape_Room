extends Node2D

#================================================================#
#	Plans for test level:
#		- first look at the table
#		- then solve the riddle to search the correct chair
#		- then look in closet
#		- find the plant that looks different
#		- finish
#
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
	$Dialogue.visible = false
	$InteractPopUp.visible = false
	
	connect_signals()
	#$Player.connect_signal(get_node("./Map/Furnitures/DoubleBed"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func connect_signals():
	for child_node in $Map/Furnitures.get_children():
		child_node.player = $Player
		child_node.connect_signal()
	
