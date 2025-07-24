extends CharacterBody2D


@export var SPEED = 300.0

func _process(delta: float) -> void:
	var xdirection = Input.get_axis("left", "right")
	var ydirection = Input.get_axis("up", "down")
	
	if xdirection or ydirection:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("Idle")
	
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
