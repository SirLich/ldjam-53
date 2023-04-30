extends Marker2D

@export var to_spawn : Array[PackedScene]
@export var chance : float

func _ready():
	if not get_owner().disable_spawns:
		if randf() < chance:
			var new_scene = to_spawn.pick_random().instantiate()
			add_child(new_scene)
