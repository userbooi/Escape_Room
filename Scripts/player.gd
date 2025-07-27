extends CharacterBody2D


@export var SPEED = 300.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var xdirection = Input.get_axis("left", "right")
	var ydirection = Input.get_axis("up", "down")
	
	change_anim(xdirection, ydirection)
	change_dir(xdirection, ydirection)
	
	check_interactable()

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
	else:
		get_node("../InteractPopUp").visible = false

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

	move_and_slide()
	
func connect_signal(node: Node2D) -> void:
	node.connect("interact", Callable(self, "_on_interact_prompt"))
	node.connect("exit_interact", Callable(self, "_on_exit_interact_prompt"))
	
#func _on_interact_prompt():
	#get_node("../InteractPopUp").visible = true
	#taken = true
	#
#func _on_exit_interact_prompt():
	#get_node("../InteractPopUp").visible = false
	#taken = false
