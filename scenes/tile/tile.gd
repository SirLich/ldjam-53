extends Node2D

@export var disable_spawns = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.distance - global_position.x > 4000:
		queue_free()
