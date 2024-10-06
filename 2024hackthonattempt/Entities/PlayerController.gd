extends CharacterBody2D


var SPEED = 200.0
var JUMP_VELOCITY = -300.0
var DASH_VELOCITY = 600
var jump_count = 1
var dashing := false
var dash_time = 0.1
var spawn := Vector2(0,0)
var dead = false

@export var animated_sprite : AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer
@onready var dash_noise = $Dash
@onready var jump_noise = $Jump
@onready var death_noise = $Die
@onready var bleat_noise = $Bleat

func _physics_process(delta):
	# Add the gravity.
	if velocity.x > 0:
		animated_sprite.flip_h = false
	elif velocity.x < 0:
		animated_sprite.flip_h = true
	
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
	if (Input.is_action_just_pressed("ui_accept") || !coyote_timer.is_stopped()) && jump_count > 0:
		jump_noise.play()
		jump_count -= 1
		if is_on_floor() || !coyote_timer.is_stopped():
			velocity.y = JUMP_VELOCITY
		else:
			velocity.y = JUMP_VELOCITY / 1.5
	
	if (Input.is_action_just_pressed("bleat") && velocity == Vector2.ZERO && dead == false):
		bleat_noise.play()
	
	if Input.is_action_just_pressed("dash") && jump_count > 0 && velocity.x != 0 && not is_on_floor():
		dash_noise.play()
		jump_count -= 1
		dashing = true
		print(velocity.x)
		dash_time = 0.1
	
	if is_on_floor():
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
	var was_on_floor = is_on_floor()
	
	move_and_slide()
	
	if was_on_floor && !is_on_floor:
		coyote_timer.start()


func _on_area_2d_body_entered(body):
	print("die")
	death_noise.play()
	dead = true


func _on_animated_sprite_2d_animation_finished():
	if dead == true:
		self.position = spawn
		dead = false
	pass # Replace with function body.
	
