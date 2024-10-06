extends Area2D

class_name interactionArea

@export var action_name : String = "Bestow a curse upon yourself..."

var interact : Callable = func():
	pass
	



func _on_body_entered(body:CharacterBody2D):
	InteractionManager.register_area(self)
	



func _on_body_exited(body:CharacterBody2D):
	InteractionManager.unregister_area(self)
	
