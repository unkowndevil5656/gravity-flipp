extends CharacterBody2D

var speed = 200
var jump_force = 400
var gravity = 900
var flipped = false

func _physics_process(delta):
	if not is_on_floor() or not flipped:
		velocity.y += gravity * delta
	else:
		# Apply inverted gravity
		velocity.y += -gravity * delta
		
	if Input.is_action_just_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_just_pressed("move_left"):
		velocity.x = -speed
	

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force if not flipped else -jump_force
	move_and_slide()

	if Input.is_action_just_pressed("flip_gravity"):
		flip_gravity()

func flip_gravity():
	flipped = not flipped
	$Sprite.scale.y *= -1
  
