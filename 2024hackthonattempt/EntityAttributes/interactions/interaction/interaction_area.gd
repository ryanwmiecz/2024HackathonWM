extends Area2D

class_name interactionArea

@export var action_name : String = "Interact"

var interact : Callable = func():
	pass
	



func _on_body_entered(body):
	InteractionManager.register_area(self)
	print("im here enter")



func _on_body_exited(body):
	InteractionManager.unregister_area(self)
	print("im here exit")
	
