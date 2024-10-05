extends Node
class_name healthAttribute


@export var maxHealth : int = 5
var curHealth : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curHealth = maxHealth


# Called every frame. 'delta' is the elapsed time since the previous frame.
func healthChange (damage):
	curHealth -= damage
	
	if curHealth <=0:
		get_parent().queue_free()
  
