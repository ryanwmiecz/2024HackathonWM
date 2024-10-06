extends Node

var songs : Array = []

func _ready():
	for child in get_children():
		if child is AudioStreamPlayer2D:
			songs.append(child)
	PlayRandom()

func PlayRandom():
	songs.pick_random().play()


func _on_audio_stream_player_2d_finished():
	PlayRandom()


func _on_audio_stream_player_2d_2_finished():
	PlayRandom()

func _on_audio_stream_player_2d_3_finished():
	PlayRandom()

func _on_audio_stream_player_2d_4_finished():
	PlayRandom()
	
func _on_audio_stream_player_2d_5_finished():
	PlayRandom()
