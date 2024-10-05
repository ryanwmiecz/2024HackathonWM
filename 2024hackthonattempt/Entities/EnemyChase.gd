extends State
class_name EnemyChase

var player
var movespeed = 100.0
@export var enemy : CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(delta: float):
	print(enemy.position.x)
	if player.position.x < enemy.position.x:
		enemy.velocity = Vector2(-1 * movespeed, 0)
	elif player.position.x > enemy.position.x:
		enemy.velocity = Vector2(movespeed, 0)
	else:
		enemy.velocity = Vector2.ZERO
