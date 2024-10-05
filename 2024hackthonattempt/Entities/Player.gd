extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var double_jump = true


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor(): # todo!! assign in input map (wasd)
			double_jump = true
			velocity.y = JUMP_VELOCITY
		else:
			if double_jump:
				double_jump = false
				velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right") # todo!! assign in input map
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#func attack(attackAttribute):
	#if Input.action_press("ui_accept"):
		
