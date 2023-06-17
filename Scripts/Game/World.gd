extends Node2D

func _ready():
	var music_name = randi_range(0,4)
	$AudioStreamPlayer.stream = load("res://Assets/Audio/Music/city"+str(music_name) +".mp3")
	$AudioStreamPlayer.play()


func _on_audio_stream_player_finished():
	var music_name = ["city2","city3","city4"].pick_random()
	$AudioStreamPlayer.stream = load("res://Assets/Audio/Music/"+str(music_name) +".mp3")
	$Fade.play("Music Transition")
	$AudioStreamPlayer.play()
