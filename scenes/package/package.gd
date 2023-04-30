extends Node2D

@export var fall_speed = 300
var side_speed = 0
var friction = 3000

@onready var area_2d = $Area2D

func _process(delta):
	
	for ar in area_2d.get_overlapping_areas():
		if ar.is_in_group("ground"):
			Global.points -= 50
			Global.package_crash.play()
			queue_free()
			
		if ar.is_in_group("target"):
			Global.package_land.play()
			Global.points += 250
			queue_free()
			
	position.y += fall_speed * delta
	position.x += side_speed * delta
	
	if side_speed > 0:
		side_speed -= (delta * friction)
	else:
		side_speed = 0
		
	
	rotation =  -side_speed / 3 / fall_speed
