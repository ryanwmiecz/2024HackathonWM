extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DETECT_RANGE = 200
const ATTCK_RANGE = 13


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
		$RayCast2D.target_position.x = -DETECT_RANGE
		$Area2D/Hitbox.position.x = -ATTCK_RANGE
	else:
		$AnimatedSprite2D.flip_h = true
		$RayCast2D.target_position.x = DETECT_RANGE
		$Area2D/Hitbox.position.x = ATTCK_RANGE
	move_and_slide()
