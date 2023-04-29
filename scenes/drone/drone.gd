extends Node2D
class_name Drone

var speed = 0
var acceleration = 0
var max_speed = 900 # Speed gain per second

@onready var pcam : PhantomCamera2D = $Pcam

func launch():
	speed = 1
	acceleration = 200
	
	await get_tree().create_timer(1).timeout
	acceleration = 0
	pcam.set_priority(2)
	
	
func _ready():
	pass # Replace with function body.

func _process(delta):
	if acceleration:
		speed = speed * acceleration * delta
		
	speed = min(speed, max_speed)
	translate(get_global_transform().x * delta * speed)
