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


	
