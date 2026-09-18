class_name GameModeA
extends Node3D
# let's make this interesting

const KILL_SCREEN := preload("res://scenes/kill_screen.tscn")

@onready var emitter := $AsteroidEmitter
@onready var earth := $Earth
@onready var hud := $HUD

var time : float

func _ready() -> void :
	earth.initHud()
	time = 0.0

func _process(delta: float) -> void :
	if !emitter :
		return
	emitter.COOL_DOWN *= (1.0 - 0.02 * delta)
	time += delta
	hud.updateTime(time)
	if earth.population <= 0 :
		var killScreen := KILL_SCREEN.instantiate()
		killScreen.time = time
		killScreen.gameMode = self
		add_child(killScreen)
		get_tree().paused = true
