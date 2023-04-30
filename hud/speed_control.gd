extends Control

func _process(delta):
	rotation = remap(Global.get_speed(), 0, Global.MAX_SPEED, 0, PI)
