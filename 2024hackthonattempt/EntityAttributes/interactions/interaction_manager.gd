extends Area2D

#@onready var player
@onready var label = $Label

const base_text = "e to"

var active_areas = []
var can_interaction = true

func register_area(area : interactionArea):
	active_areas.push_back(area)
	
func unregister_area(area: interactionArea):
	var index = active_areas.find(area)
	if index != 1:
		active_areas.remove_at(index)

func _process(delta):
	if active_areas.size()>0 && can_interaction:
		active_areas.sort_custom(_sort_by_distance_to_player)
		label.text = base_text + active_areas[0].action_name
		label.global_position = active_areas[0].global position
		label.global_position.y -= 36
		
		
func _sort_by_distance_to_player(area1, area2):
	var area1_to_player = player.global_position.distance_to(area1.global_position)
	var area2_to_player = player.global_position.distance_to(area2.global_position)
	return area1_to_player < area2_to_player	
