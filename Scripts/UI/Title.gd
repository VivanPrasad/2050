extends Control

func _process(_delta):
	if $Background.position.y > -4300:
		$Background.position.y -= 4
	else:
		$Background.position.y = 0

func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/World.tscn")
	queue_free()
