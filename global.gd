extends Node2D

@export var MAX_HEIGHT = - 2_000
var MAX_SPEED = 2000

var speed = 0
var height= 0
var battery = 25

func get_speed():
	return speed
	
func get_height():
	return height
