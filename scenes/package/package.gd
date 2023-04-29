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
		
	
	rotation =  -max(side_speed / fall_speed, 0.2)
