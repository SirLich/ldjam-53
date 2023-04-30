extends Node2D
class_name Drone

# Constants
var MAX_SPEED = 900
var ROTATION_SPEED = 1
var FRICTION = 50
var STALL_FRICTION = 500
var STALL_SPEED = 200

# Variables
var launched = false
var is_stalling = false
var speed = 0
var acceleration = 0 

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


	if launched:
		speed -= FRICTION * delta
		if speed < STALL_SPEED:
				is_stalling = true
				speed -= (STALL_FRICTION * delta)
			
	speed = clamp(speed, 0, MAX_SPEED)
	
	translate(get_global_transform().x * delta * speed)
	translate(get_global_transform().y * delta * 9.81)

	if launched:
		var red = global_transform.x
		var blue = global_position.direction_to(get_global_mouse_position())
		var test = red.angle_to(blue)
		
		if not is_stalling:
			rotation = rotation + (ROTATION_SPEED * test * delta)
		
		

