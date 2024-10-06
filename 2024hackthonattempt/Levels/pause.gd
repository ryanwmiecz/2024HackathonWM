extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		print("hello!")
		pause_or_unpause()
		
func pause_or_unpause():
	if get_tree().paused == true:
		$"CanvasLayer/VBoxContainer/Button".hide()
		$"CanvasLayer/VBoxContainer/Button3".hide()
		get_tree().paused = false
	elif get_tree().paused == false:
		$"CanvasLayer/VBoxContainer/Button".show()
		$"CanvasLayer/VBoxContainer/Button3".show()
		get_tree().paused = true


func _on_button_pressed() -> void:
	pause_or_unpause()




func _on_button_3_pressed() -> void:
	get_tree().quit()
