extends Node2D
class_name Game

var last_spawn = 0
var tile_width = 1920

@export var tile_length : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_distance():
	return $Drone.global_position.x
	
func _process(delta):
	if get_distance() - last_spawn > tile_width:
		print("SPAWN")
		last_spawn = get_distance()
		
		var copy = load("res://scenes/tile/tile.tscn").instantiate()
		add_sibling(copy)
		copy.global_position.x = snapped(get_distance() + tile_width, tile_width)
 
