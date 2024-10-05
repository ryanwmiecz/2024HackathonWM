extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DASH_VELOCITY = 600
var jump_count = 1
var dashing := false
var dash_time = 0.1


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() && dashing == false:
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") && jump_count > 0:
		jump_count -= 1
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("dash") && jump_count > 0 && velocity.x != 0:
		print(jump_count)
		jump_count -= 1
		dashing = true
		print(velocity.x)
		dash_time = 0.1
	
	if is_on_floor():
		jump_count = 1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction && dashing == false:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if dashing == true:
		if dash_time <= 0:
			dashing = false
		else:
			velocity.x = direction * DASH_VELOCITY
			velocity.y = 0
			dash_time -= delta

	move_and_slide()
