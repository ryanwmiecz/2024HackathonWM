extends Node
class_name attackAttribute


@export var attack : int = 5
var curAttack : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curAttack = attack


# Called every frame. 'delta' is the elapsed time since the previous frame.
func healthChange ():
	print("hello")
