extends State
class_name EAttackMelee


var cooldown = 0
@export var enemy : CharacterBody2D
@export var HitBox : Area2D
var player

func Enter():
	enemy.velocity = Vector2.ZERO
	player = get_tree().get_first_node_in_group('Player')

func Update(delta : float):
	if !HitBox.get_overlapping_bodies().has(player):
		Transitioned.emit(self, 'EnemyChase')
		
	if cooldown > 0:
		Attack()
		cooldown = 1
	else:
		cooldown -= delta

func Attack():
	pass
	
	
