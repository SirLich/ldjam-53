extends Node2D
class_name Drone

var speed = 0
var acceleration = 0
var max_speed = 900 # Speed gain per second
var rotation_speed = 1
var max_rot = 2
var launched = false

@onready var pcam : PhantomCamera2D = $Pcam

func launch():
	speed = 1
	acceleration = 200
	
	await get_tree().create_timer(1).timeout
	acceleration = 0
	pcam.set_priority(2)
	
	await get_tree().create_timer(2).timeout
	launched = true
	
func _ready():
	pass # Replace with function body.

func _process(delta):
	if acceleration:
		speed = speed * acceleration * delta
	
	speed = min(speed, max_speed)
	translate(get_global_transform().x * delta * speed)
	
	if launched:
		var red = global_transform.x
		var blue = global_position.direction_to(get_global_mouse_position())
		var test = red.angle_to(blue)
		
		# var relative = global_position.angle_to(get_global_mouse_position()) / get_viewport().size.y * 2
		
		print(test)
		rotation = rotation + (rotation_speed * test * delta)
		

