extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_button_2_pressed() -> void:
	$"HBoxContainer3".visible = true
	$"HBoxContainer3/VBoxContainer/Label".visible = true
	$"HBoxContainer/VBoxContainer/Button2".visible = false
	$"HBoxContainer/VBoxContainer/Button".visible = false
	$"HBoxContainer3/VBoxContainer/BackCredits".visible = true
	$"HBoxContainer2/Title".visible = false
	$"HBoxContainer3/VBoxContainer".visible = true

func _on_back_credits_pressed() -> void:
	$"HBoxContainer3".visible = false
	$"HBoxContainer3/VBoxContainer/Label".visible = false
	$"HBoxContainer/VBoxContainer/Button2".visible = true
	$"HBoxContainer/VBoxContainer/Button".visible = true
	$"HBoxContainer3/VBoxContainer/BackCredits".visible = false
	$"HBoxContainer2/Title".visible = true
	$"HBoxContainer3/VBoxContainer".visible = false
