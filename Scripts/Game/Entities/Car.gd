extends StaticBody2D

var blocked = false

var frame = 0
func _on_area_2d_body_entered(body):
	if body.name == "Player" or (str(body.name).contains("Car") and body.name != self.name):
		blocked = true

func _on_area_2d_body_exited(body):
	if body.name == "Player" or (str(body.name).contains("Car") and body.name != self.name):
		blocked = false

func _process(_delta):
	rotation = get_parent().rotation * -1 
func _physics_process(_delta):
	$Sprite2D.frame = frame
	$Area2D/CollisionShape2D.position = [Vector2(26,0),Vector2(0,-26),Vector2(-26,0),Vector2(0,26)][frame]
