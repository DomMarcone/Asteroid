extends Node3D

@export var START_RADIUS := 40.0
@export var COOL_DOWN := 2.0

const ASTEROIDS : Array[PackedScene] = [
	preload("res://scenes/asteroids/asteroid_a.tscn"),
	preload("res://scenes/asteroids/asteroid_b.tscn"),
	preload("res://scenes/asteroids/asteroid_c.tscn")
]

const EXPLOSION_SOUNDS : Array[AudioStream] = [
	preload("res://assets/explosion/explosion-a.wav"),
	preload("res://assets/explosion/explosion-b.wav")
]

var parent : Node3D
var time : float

func _ready() -> void :
	parent = get_parent()
	time = 0.0

func _process(delta: float) -> void :
	time += delta
	if time > COOL_DOWN :
		time = 0.0
		add(floor(len(ASTEROIDS) * randf()), randf() * 6.28)

func add(index: int, theta: float) :
	var pos = Vector3(
		START_RADIUS * cos(theta),
		START_RADIUS * sin(theta),
		0.0)
	var asteroidScene = ASTEROIDS[index]
	var asteroid = asteroidScene.instantiate()
	asteroid.asteroidSpeed += 2.0 * randf()
	#asteroid.explosionSound = EXPLOSION_SOUNDS.pick_random()
	#asteroid.damage = 100 + int(100 * randf())
	asteroid.global_position = pos
	parent.add_child(asteroid)
