extends Control

@export var text = ""
@export var icon : Texture2D

@onready var texture_rect : TextureRect = $TextureRect
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = text
	texture_rect.texture = icon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
