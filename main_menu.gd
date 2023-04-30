extends Control

@onready var out_sound = $OutSound
@onready var in_sound = $InSound
@onready var click_sound = $ClickSound
@export var points_label : PackedScene
@onready var v_box_container = $VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in Global.play_sessions:
		var new_scene = points_label.instantiate()
		v_box_container.add_child(new_scene)
		new_scene.text = str(i)



func _on_how_to_button_button_up():
	click_sound.play()
	get_tree().change_scene_to_file("res://rules.tscn")


func _on_play_button_pressed():
	Global.start()
	click_sound.play()
	get_tree().change_scene_to_file("res://game.tscn")


func _button_mouse_entered():
	in_sound.play()
	
	
func _button_mouse_exited():
	pass
	# in_sound.play()
