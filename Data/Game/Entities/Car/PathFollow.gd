extends PathFollow2D
var velocity = 1
func _process(_delta):
	progress += velocity
	if not get_child(0).blocked:
		if velocity < 1.02:
			velocity += 0.02
		else:
			velocity = 1
	else:
		if velocity > 0.04:
			velocity -= 0.04
		else:
			velocity = 0
	if abs(0.0 + round(rotation_degrees)) <= 5.0:
		get_child(0).frame = 0
	if abs(90.0 + round(rotation_degrees)) <= 5.0 or abs(270 + round(rotation_degrees)) <= 5.0:
		get_child(0).frame = 1
	if abs(180.0 + round(rotation_degrees)) <= 5.0 or abs(-180.0 + round(rotation_degrees)) <= 5.0:
		get_child(0).frame = 2
	if abs(-90.0 + round(rotation_degrees)) <= 5.0 or abs(270 + round(rotation_degrees)) <= 5.0:
		get_child(0).frame = 3
	
