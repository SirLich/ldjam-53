extends Node2D
class_name Drone

# Constants
var ROTATION_SPEED = 2
var FRICTION = 75
var STALL_FRICTION = 20
var ANGLE_FRICTION = 150
var STALL_SPEED = 200
var GRAVITY = 150
var STALL_GRAVITY = 800
var BOOST_SPEED = 175
var BATTERY_DRAIN = 25

# Variables
var launched = false
var is_stalling = false
var speed = 0
var acceleration = 0 
var boost = false
var current_speed = 0

@onready var audio = $AudioStreamPlayer2D
@onready var cpu_particles_2d = $CPUParticles2D
	
@onready var area = $Area
@onready var pcam : PhantomCamera2D = $Pcam
@export var package_scene : PackedScene
@export var world : Node2D

func launch():
	speed = 1200
	$ AudioStreamPlayer2D.play()
	
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
		
	if event.is_action_pressed("left_click"):
		start_boost()
		
	if event.is_action_released("left_click"):
		stop_boost()
			

func start_boost():
	if not boost and Global.battery > 0:
		boost = true
		audio.volume_db = 15
		cpu_particles_2d.emitting = true
		
func stop_boost():
	if boost:
		cpu_particles_2d.emitting = false
		boost = false
		audio.volume_db = 1


func _process(delta):
	for ar in area.get_overlapping_areas():
		if ar.is_in_group("ground"):
			print("DEAD")
			
		if ar.is_in_group("battery"):
			Global.battery += 10
			ar.owner.queue_free()
	
	if boost:
		Global.battery -= BATTERY_DRAIN * delta
		
	if Global.battery < 0:
		stop_boost()
		
	var angle = global_rotation + 0.2
	if launched:
		speed -= FRICTION * delta
		speed += ANGLE_FRICTION * delta * angle
		
		if boost:
			speed += BOOST_SPEED * delta
			
		if speed < STALL_SPEED:
				is_stalling = true
				GRAVITY = STALL_GRAVITY
				speed -= (STALL_FRICTION * delta)
				
	speed = clamp(speed, 0,  Global.MAX_SPEED)
	Global.speed = speed
	Global.height = global_position.y
		
	translate(get_global_transform().x * delta * speed)
	
	# global_transform.x += (get_global_transform().x * delta * speed)

	if launched:
		global_position.y += delta * GRAVITY
		
		var red = global_transform.x
		var blue = global_position.direction_to(get_global_mouse_position())
		var test = red.angle_to(blue)
		
		if not is_stalling:
			rotation = rotation + (ROTATION_SPEED * test * delta)
		

