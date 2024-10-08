extends State
class_name EnemyWander

@export var enemy : CharacterBody2D
@export var movespeed := 50.0
@export var detector : RayCast2D

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1), 0).normalized()
	wander_time  = randf_range(1, 3)

func Enter():
	randomize_wander()

func Update(delta : float):
	if wander_time > 0:
		wander_time -= delta
	
	else:
		randomize_wander()
		
func Physics_Update(delta : float):
	if enemy:
		enemy.velocity = move_direction * movespeed
	
	var detection = detector.get_collider()
	if detection != null and detection.name == 'Player':
		Transitioned.emit(self, "EnemyChase")
