#Do not edit, if u need a change tell me and i will edit and update this push.

extends Control

#Testing #testing im so testing coded

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
 	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Entities/emily_debug_scene.tscn")





func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Entities/aaron_debug_scene.tscn")






func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/ryan_testing.tscn")
