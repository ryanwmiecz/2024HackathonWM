extends Area2D

class_name interactionArea

@export var action_name : String = "Interact on testing"

var interact : Callable = func():
	pass
	



func _on_body_entered(body):
	InteractionManager.register_area(self)



func _on_body_exited(body):
	InteractionManager.unregister_area(self)
	
