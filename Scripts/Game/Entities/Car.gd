extends StaticBody2D

var blocked = false

func _ready():
	$AudioStreamPlayer2D.play(randf_range(0.0,11.00))
var wait_timer = 1000
var frame = 0
func _on_area_2d_body_entered(body):
	if body.name == "Player" or (str(body.name).contains("Car") and body != self):
		blocked = true
func _on_area_2d_body_exited(body):
	if body.name == "Player" or (str(body.name).contains("Car") and body != self):
		blocked = false

func _process(_delta):
	print($Sprite2D.frame)
	$Sprite2D.rotation = get_parent().rotation * -1 
func _physics_process(_delta):
	$Sprite2D.frame = frame
	#$Area2D/CollisionShape2D.position = [Vector2(26,0),Vector2(0,-26),Vector2(-26,0),Vector2(0,26)][frame]
