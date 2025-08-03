extends CharacterBody2D
signal interact

@export var SPEED = 300.0


var movable = true
var interactable = false
var furn_name
var game_settings = preload("res://game_setting/game_setting.tres")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	handle_movement()
	handle_interactions()

func handle_movement():
	var xdirection = Input.get_axis("left", "right")
	var ydirection = Input.get_axis("up", "down")
	
	if movable:
		change_anim(xdirection, ydirection)
		change_dir(xdirection, ydirection)
		
func handle_interactions():
	if movable:
		check_interactable()
	interacting()

func interacting():
	if Input.is_action_just_pressed("interact") and interactable:
		get_node("../Dialogue").visible = true
		
		furn_name = $PlayerInteractArea.get_overlapping_areas()[0].get_parent().furniture_name
		if game_settings.found:
			if furn_name == game_settings.special_events[game_settings.event_num+1]:
				game_settings.event_num += 1
		game_settings.curr_state = game_settings.STATES.DIALOGUE
		interact.emit(furn_name, furn_name==game_settings.special_events[game_settings.event_num])
		
		$AnimatedSprite2D.play("Idle")
		movable = false
		interactable = false
	if Input.is_action_just_pressed("deleteAll") and game_settings.DEBUG:
		for node in get_tree().get_nodes_in_group("furnitures"):
			node.queue_free()
		
func _return_from_dia():
	movable = true
	interactable = true
	game_settings.curr_state = game_settings.STATES.PLAYING

func change_anim(xdirection, ydirection):
	if xdirection or ydirection:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("Idle")
		
func change_dir(xdirection, ydirection):
	if xdirection == 1:
		if ydirection:
			rotation = -PI/2 + ydirection * PI/4
		else:
			rotation = -PI/2
	elif xdirection == -1:
		if ydirection:
			rotation = PI/2 - ydirection * PI/4
		else:
			rotation = PI/2
	else:
		if ydirection:
			rotation = PI/2 - ydirection * PI/2
			
func check_interactable():
	if $PlayerInteractArea.has_overlapping_areas():
		get_node("../InteractPopUp").visible = true
		interactable = true
	else:
		get_node("../InteractPopUp").visible = false
		interactable = false

func _physics_process(delta: float) -> void:
	var xdirection = Input.get_axis("left", "right")
	var ydirection = Input.get_axis("up", "down")
	
	if xdirection:
		velocity.x = xdirection
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if ydirection:
		velocity.y = ydirection
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	velocity = velocity.normalized() * SPEED

	if movable:
		move_and_slide()
	
func connect_signal(node: Node2D) -> void:
	node.connect("interact", Callable(self, "_on_interact_prompt"))
	node.connect("exit_interact", Callable(self, "_on_exit_interact_prompt"))
	
func disable() -> void:
	movable = false
	$Camera2D.enabled = false
	interactable = false
	
func enable() -> void:
	movable = true
	$Camera2D.enabled = true
	interactable = false
	
#func _on_interact_prompt():
	#get_node("../InteractPopUp").visible = true
	#taken = true

#func _on_exit_interact_prompt():
	#get_node("../InteractPopUp").visible = false
	#taken = false
