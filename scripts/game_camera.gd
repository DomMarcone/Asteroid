class_name GameCamera
extends Node3D

var rumbleFrequency := 18.0
var rumbleAmount := 0.0

const RUMBLE_DECAY := 0.95

var time : float

@onready var camera := $Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !camera :
		return
	time += delta
	camera.position = Vector3(
		rumbleAmount * cos(rumbleFrequency * time),
		rumbleAmount * sin(rumbleFrequency * time),
		0.0
	)
	#print("VIBRATION: ", camera.position)
	rumbleAmount *= RUMBLE_DECAY * (1.0 - delta)
	
