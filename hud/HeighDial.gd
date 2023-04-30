extends TextureRect

func _process(delta):
	position.y = remap(Global.get_height(), 0, Global.MAX_HEIGHT, 70, -150)
