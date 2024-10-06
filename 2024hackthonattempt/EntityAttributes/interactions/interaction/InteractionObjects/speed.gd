extends StaticBody2D

@onready var interaction_area =$InteractionArea
@onready var sprite = $Sprite2D
@onready var player = get_tree().get_first_node_in_group("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_command")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _command():
	player.JUMP_VELOCITY = -1
	player.dash_time = 1
	
