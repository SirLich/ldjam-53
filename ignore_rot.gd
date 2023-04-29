extends Sprite2D

@export var gradient : GradientTexture1D
@export var world : Node2D
var range = 5

func height_percentage():
	return clamp(-world.global_position.y / Global.max_height, 0, 1)
	
	
func _process(delta):
	var hp = height_percentage()
	var grad : Gradient = texture.gradient
	grad.set_color(1, gradient.gradient.sample(hp))
	grad.set_color(0, gradient.gradient.sample(hp + range))
