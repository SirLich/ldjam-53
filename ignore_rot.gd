extends Sprite2D

@export var gradient : GradientTexture1D
@export var world : Node2D
var range = 1

func height_percentage():
	return clamp(Global.get_height() / Global.MAX_HEIGHT, 0, 1)
	
	
func _process(delta):
	var hp = height_percentage()
	var grad : Gradient = texture.gradient
	grad.set_color(1, gradient.gradient.sample(hp))
	grad.set_color(0, gradient.gradient.sample(hp + range))
