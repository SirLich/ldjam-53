extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.x < -3000:
		
		var copy = load("res://scenes/tile/tile.tscn").instantiate()
		add_sibling(copy)
		copy.global_position.x = global_position.x + (1920 * 3)
		queue_free()
