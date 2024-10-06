extends StaticBody2D

@onready var interaction_area =$InteractionArea
@onready var sprite = $Sprite2D
@onready var player = get_tree().get_first_node_in_group("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_command")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _command():
	self.hide()#comment this out if u want it to be reusable
	#put what u want it to do on interact here

"""
func _on_interaction_area_body_entered(body:CharacterBody2D) -> void:
	self.queue_free()

"""
