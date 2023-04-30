extends Node2D

@export var MAX_HEIGHT = - 2_000
var MAX_SPEED = 2000

var speed = 0
var height= 0
var battery = 25
var packages = 2
var points = 0

var play_sessions = []

func finish():
	play_sessions.append(points)
	
func start():
	speed = 0
	height= 0
	battery = 25
	packages = 2
	points = 0

var MAX_PACKAGES = 2

func get_speed():
	return speed
	
func get_height():
	return height
