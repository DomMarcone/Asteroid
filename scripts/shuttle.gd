class_name Shuttle
extends Area3D

const VELOCITY := 8.0
const ACCELERATION := 2.0
const MAX_TIME := 8.0
const ROTATION_SPEED := 1.0

var direction := Vector3.UP
var time : float
var velocity : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.direction = global_basis * Vector3.UP
	self.time = 0.0
	global_position += direction * 2.0
	velocity = VELOCITY

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += direction * velocity * delta
	velocity += ACCELERATION * delta
	rotate(direction, ROTATION_SPEED * delta)
	self.time += delta
	if self.time > MAX_TIME :
		queue_free()
