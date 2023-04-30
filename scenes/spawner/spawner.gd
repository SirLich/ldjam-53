extends Marker2D

@export var to_spawn : Array[PackedScene]
@export var chance : float

func _ready():
	if randf() < chance:
		var new_scene = to_spawn.pick_random().instantiate()
		add_child(new_scene)
