extends Node2D
class_name Drone

# Constants
var ROTATION_SPEED = 1
var FRICTION = 20
var STALL_FRICTION = 20
var ANGLE_FRICTION = 150
var STALL_SPEED = 200
var GRAVITY = 150
var STALL_GRAVITY = 800

# Variables
var launched = false
var is_stalling = false
var speed = 0
var acceleration = 0 

var current_speed = 0

@onready var pcam : PhantomCamera2D = $Pcam
@export var package_scene : PackedScene
@export var world : Node2D

func launch():
	speed = 1200
	
	await get_tree().create_timer(0.7).timeout
	pcam.set_priority(2)
	
	await get_tree().create_timer(2).timeout
	launched = true
	
func _ready():
	pass # Replace with function body.

func get_speed():
	return current_speed
	
func _input(event):
	if launched and event.is_action_released("spacebar"):
		var new_package = package_scene.instantiate() 
		new_package.global_position = global_position
		world.add_child(new_package)
		new_package.global_position = global_position
	
func _process(delta):
	
	var angle = global_rotation + 0.2
	if launched:
		speed -= FRICTION * delta
		speed += ANGLE_FRICTION * delta * angle
		
		if speed < STALL_SPEED:
				is_stalling = true
				GRAVITY = STALL_GRAVITY
				speed -= (STALL_FRICTION * delta)
				
	speed = clamp(speed, 0,  Global.MAX_SPEED)
	Global.speed = speed
		
	translate(get_global_transform().x * delta * speed)
	
	# global_transform.x += (get_global_transform().x * delta * speed)

	if launched:
		global_position.y += delta * GRAVITY
		
		var red = global_transform.x
		var blue = global_position.direction_to(get_global_mouse_position())
		var test = red.angle_to(blue)
		
		if not is_stalling:
			rotation = rotation + (ROTATION_SPEED * test * delta)
		

