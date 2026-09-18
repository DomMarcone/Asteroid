class_name HUD
extends Control

@onready var population := $population
@onready var timer := $timer
@onready var score := $rect/score

var lastTime : float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func updatePopulation(num: int) -> void:
	if num <= 0:
		population.text = "0" 
	elif num > 1200 :
		population.text = "%.1f billion" % (num/1000.0)
	else :
		population.text = "%d million" % num

func updateTime(time) -> void :
	lastTime = time
	timer.text = Util.getTime(time)
