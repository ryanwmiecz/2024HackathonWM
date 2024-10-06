extends CharacterBody2D


var SPEED = 180.0
var JUMP_VELOCITY = -300.0
var DASH_VELOCITY = 2000
var jump_count = 1
var dashing := false
var dash_time = 0.2
var spawn := Vector2(0,0)
var dead = false
var on_slope = false
var can_dash = true

@export var animated_sprite : AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer
@onready var dash_noise = $Dash
@onready var jump_noise = $Jump
@onready var death_noise = $Die
@onready var bleat_noise = $Bleat
@onready var raycast = $RayCast2D

func _physics_process(delta):
	# Add the gravity.
	if velocity.x > 0:
		animated_sprite.flip_h = false
		raycast.target_position.x = 5
	elif velocity.x < 0:
		animated_sprite.flip_h = true
		raycast.target_position.x = -5
	
	
	
	if dead:
		animated_sprite.play("die")
	elif dashing:
		animated_sprite.play("dash")
	elif is_on_floor() && velocity == Vector2.ZERO:
		animated_sprite.play("idle")
	elif is_on_floor() && velocity.x != 0:
		animated_sprite.play("walk")
	elif velocity.y > 0:
		animated_sprite.play("jump")
	elif velocity.y < 0:
		animated_sprite.play("fall")
	
	
	if not is_on_floor() && dashing == false:
		velocity += get_gravity() * delta
	
	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") && jump_count > 0) && !dead:
		jump_noise.play()
		jump_count -= 1
		if is_on_floor() || !coyote_timer.is_stopped():
			velocity.y = JUMP_VELOCITY
		else:
			velocity.y = JUMP_VELOCITY / 1.2
	
	if (Input.is_action_just_pressed("bleat") && velocity == Vector2.ZERO && dead == false):
		bleat_noise.play()
	
	if can_dash && Input.is_action_just_pressed("dash") && jump_count > 0 && velocity.x != 0 && not is_on_floor():
		dash_noise.play()
		jump_count -= 1
		dashing = true
		print(velocity.x)
		dash_time = 0.1
	
	if Input.is_action_just_pressed('reset'):
		Die()
	
	if is_on_floor() || !coyote_timer.is_stopped():
		jump_count = 1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction && dashing == false && dead == false:
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
			
	
	var detection = raycast.get_collider()
	if detection != null:
		print("onslope")
		velocity.x *= 2
	var was_on_floor = is_on_floor()
	
	
	move_and_slide()
	
	if was_on_floor && !is_on_floor():
		print("falling")
		coyote_timer.start()
	
	


func _on_area_2d_body_entered(body):
	Die()
	


func _on_animated_sprite_2d_animation_finished():
	if dead == true:
		self.position = spawn
		dead = false
	pass # Replace with function body.

func Die():
	death_noise.play()
	dead = true
	


func _on_coyote_timer_timeout():
	pass # Replace with function body.
