extends CharacterBody2D


const speed = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
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
	velocity = input_vector * speed
	move_and_slide()
