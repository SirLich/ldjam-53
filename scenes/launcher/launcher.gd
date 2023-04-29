extends Node2D
@export var drone : Drone

var is_ready = true

func _input(event):
	if is_ready and event.is_action("spacebar"):
		is_ready = false
		drone.launch()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
