extends CharacterBody2D
signal interact

@export var SPEED = 300.0

var movable = true
var interactable = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var xdirection = Input.get_axis("left", "right")
	var ydirection = Input.get_axis("up", "down")
	
	if movable:
		change_anim(xdirection, ydirection)
		change_dir(xdirection, ydirection)
		
		check_interactable()
	interacting()
	
func interacting():
	if Input.is_action_just_pressed("interact") and interactable:
		get_node("../Dialogue").visible = true
		
		var furn_name = $PlayerInteractArea.get_overlapping_areas()[0].get_parent().furniture_name
		if get_parent().found:
			print("hello")
			if furn_name == get_parent().special_events[get_parent().event_num+1]:
				get_parent().event_num += 1
		interact.emit(furn_name, furn_name==get_parent().special_events[get_parent().event_num])
		
		$AnimatedSprite2D.play("Idle")
		movable = false
		interactable = false
		
func _return_from_dia():
	movable = true
	interactable = true

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
	
#func _on_interact_prompt():
	#get_node("../InteractPopUp").visible = true
	#taken = true

#func _on_exit_interact_prompt():
	#get_node("../InteractPopUp").visible = false
	#taken = false
