extends Node2D

@export var fall_speed = 300
var side_speed = 500
var friction = 500

func _process(delta):
	position.y += fall_speed * delta
	position.x += side_speed * delta
	
	if side_speed > 0:
		side_speed -= (delta * friction)
	else:
		side_speed = 0
		
	
	rotation =  -side_speed / 3 / fall_speed
