extends Area2D

@export var health_attribute : healthAttribute

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func damage(attack: attackAttribute):
	if health_attribute:
		health_attribute.healthChange(attack)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
