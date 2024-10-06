extends AnimatedSprite2D

@export var next_level : String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
		var scene = load(next_level)
		get_tree().change_scene_to_packed(scene)
