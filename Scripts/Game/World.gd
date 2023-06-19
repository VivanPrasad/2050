extends Node2D

var cars
func _ready():
	var music_name = randi_range(0,4)
	$AudioStreamPlayer.stream = load("res://Assets/Audio/Music/city"+str(music_name) +".mp3")
	$AudioStreamPlayer.play()
	cars = $CarPath1.get_children()
	

func _process(_delta):
	var blocked_cars = 0
	for car in cars:
		if car.get_child(0).blocked_by_car:
			blocked_cars += 1
	if blocked_cars > 3:
		for car in cars:
			if car.get_child(0).blocked_by_car:
				car.get_child(0).blocked_by_car = false
				break

func _on_audio_stream_player_finished():
	var music_name = ["city2","city3","city4"].pick_random()
	$AudioStreamPlayer.stream = load("res://Assets/Audio/Music/"+str(music_name) +".mp3")
	$Fade.play("Music Transition")
	$AudioStreamPlayer.play()
