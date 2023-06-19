extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var is_animated = false
var running_bonus_speed = 1 #1 when walking, 25 when running
func _process(_delta):
	# Add the gravity.
	if not is_animated:
		var input_vector = Vector2(
						Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
						Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
					).normalized()
		if input_vector != Vector2.ZERO: #If moving, blend the position based on the input_vector and run!
			$AnimationTree.set("parameters/Idle/blend_position", input_vector)
			$AnimationTree.set("parameters/Walk/blend_position", input_vector)
			$AnimationTree.get("parameters/playback").travel("Walk")
		else:
			$AnimationTree.get("parameters/playback").travel("Idle")
		
		velocity = input_vector * running_bonus_speed * 35
		move_and_slide()

func _input(_event):
	if Input.is_action_pressed("sprint"):
		running_bonus_speed = 1.5
		$AnimationPlayer.speed_scale = 3
	else:
		running_bonus_speed = 1
		$AnimationPlayer.speed_scale = 1
