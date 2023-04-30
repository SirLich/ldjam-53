extends Marker2D

@export var to_spawn : PackedScene
@export var chance : float

func _ready():
	if randf() < chance:
		var new_scene = to_spawn.instantiate()
		add_child(new_scene)
