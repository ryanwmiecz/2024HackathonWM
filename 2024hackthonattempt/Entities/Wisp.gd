extends AnimatedSprite2D

var active = true

@export var cooldown_timer : Timer
@export var sprite : AnimatedSprite2D
@onready var collect_sound = $Collect
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		sprite.play("Active")
	else:
		sprite.play("Idle")


func _on_area_2d_body_entered(body):
	if body == get_tree().get_first_node_in_group("Player") && active:
		collect_sound.play()
		body.jump_count += 1
		active = false
		cooldown_timer.start()


func _on_cooldown_timeout():
	active = true # Replace with function body.
