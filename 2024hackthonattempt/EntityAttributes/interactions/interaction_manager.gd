extends Node2D

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var label = $Label

const base_text = "Press [E] to "

var active_areas = []
var can_interaction = true

func register_area(area : interactionArea):
	if (active_areas.has(area)):
		unregister_area(area)
	else:
		active_areas.push_back(area)
	print("current active areas: ",active_areas)
	
func unregister_area(area: interactionArea):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)
	print ("current active area on exit: ", active_areas)
func _process(delta):
	if active_areas.size()>0 && can_interaction:
		label.text = base_text + active_areas[0].action_name
		label.global_position = active_areas[0].global_position
		label.global_position.y -= 36
		label.global_position.x -= label.size.x/2
		label.show()
	else:
		label.hide()
		

func _input(event):
	if event.is_action_pressed("Interaction") && can_interaction:
		if active_areas.size() > 0:
			can_interaction = false
			label.hide()
			
			await active_areas[0].interact.call()
			
			can_interaction = true
