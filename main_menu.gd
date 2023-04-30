extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_button_up():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_how_to_button_button_up():
	get_tree().change_scene_to_file("res://rules.tscn")
