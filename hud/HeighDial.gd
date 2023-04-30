extends TextureRect

func _process(delta):
	position.y = remap(Global.get_height(), 0, Global.MAX_HEIGHT, 200, -200)
	print(Global.get_height())
