extends Node2D
class_name Drone

var speed = 0
var acceleration = 0 
var max_speed = 900
var rotation_speed = 1
var max_rot = 2
var launched = false

@onready var pcam : PhantomCamera2D = $Pcam
@export var package_scene : PackedScene
@export var world : Node2D

func launch():
	speed = 1
	acceleration = 200
	
	await get_tree().create_timer(0.7).timeout
	acceleration = 0
	pcam.set_priority(2)
	
	await get_tree().create_timer(0.2).timeout
	launched = true
	
func _ready():
	pass # Replace with function body.

func _input(event):
	if launched and event.is_action_released("spacebar"):
		var new_package = package_scene.instantiate()
		new_package.global_position = global_position
		world.add_child(new_package)
		new_package.global_position = global_position
	
func _process(delta):
	if acceleration:
		speed = speed * acceleration * delta
	
	speed = min(speed, max_speed)
	world.translate(get_global_transform().x * delta * speed * -1)
	
	if launched:
		var red = global_transform.x
		var blue = global_position.direction_to(get_global_mouse_position())
		var test = red.angle_to(blue)
		
		
		rotation = rotation + (rotation_speed * test * delta)
		

