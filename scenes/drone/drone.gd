extends Node2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	translate(get_global_transform().x * delta * 100)
