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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$InteractPopUp.visible = false
	#for child_node in $Map/Furnitures.get_children():
		#$Player.connect_signal(child_node)
	#$Player.connect_signal(get_node("./Map/Furnitures/DoubleBed"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
