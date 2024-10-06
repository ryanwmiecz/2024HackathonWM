extends AnimatedSprite2D

var active = false

@export var sprite : AnimatedSprite2D
@onready var activate_sound = $Activate
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !active:
		sprite.play("Idle")


func _on_area_2d_body_entered(body):
	if body == get_tree().get_first_node_in_group("Player") && !active:
		body.spawn = self.position
		active = true
		activate_sound.play()
		sprite.play("Activate")
		
