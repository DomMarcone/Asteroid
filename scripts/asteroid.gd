class_name Asteroid
extends Area3D

const EXPLOSION := preload("res://scenes/explosion.tscn")

@onready var collisionShape := $CollisionShape3D

@export var asteroidSpeed := 2.2
const ROTATION_SPEED := 2.0

var direction := Vector3.DOWN
var damage := 200

@export var damageMin := 100
@export var damageMax := 200
@export var radius := 1.0

var explosionSound : AudioStream

var axis := Vector3.UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.direction = -global_position.normalized()
	self.axis = Vector3(randf(), randf(), randf()).normalized()
	self.damage = damageMin + int((damageMax - damageMin) * randf())
	self.collisionShape.shape.radius = self.radius
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += self.direction * asteroidSpeed * delta
	rotate(axis, ROTATION_SPEED * delta)

func _on_area_entered(area: Area3D) -> void:
	var explode := false
	if area is Shuttle :
		var shuttle := area as Shuttle
		explode = true
		shuttle.queue_free()
	elif area is Earth :
		var earth := area as Earth
		earth.hit(damage)
		explode = true
	if explode :
		var explosion = EXPLOSION.instantiate() as Explosion
		explosion.global_position = global_position
		explosion.pixel_size *= radius
		#explosion.audioPlayer.stream = explosionSound
		get_parent().add_child(explosion)
		queue_free()
