extends StaticBody2D

@onready var interaction_area =$InteractionArea
@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact=Callable(self, "_we_are_testing")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _we_are_testing():
	print ("testing output on interaction area")
