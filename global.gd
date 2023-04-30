extends Node2D

@export var MAX_HEIGHT = - 2_000
var MAX_SPEED = 2000

@onready var audio_stream_player = $AudioStreamPlayer
@onready var package_land = $PackageLand
@onready var package_crash = $PackageCrash

var speed
var height
var battery
var packages
var points
var distance = 0

var play_sessions = []

func finish():
	play_sessions.append(points)
	audio_stream_player.play()
	
func start():
	speed = 0
	height= 0
	battery = 40
	packages = 2
	points = 0
	var distance = 0

var MAX_PACKAGES = 2

func get_speed():
	return speed
	
func get_height():
	return height
