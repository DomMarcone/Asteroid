class_name Earth
extends Area3D

@export var population : int = 8301
@export var hud : HUD
@export var camera : GameCamera

const ROTATION_SPEED := -0.1

@onready var model := $model

func initHud() -> void :
	hud.updatePopulation(population)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !model :
		return
	model.rotate(Vector3.UP, ROTATION_SPEED * delta)

func hit(damage: int) :
	population -= damage
	hud.updatePopulation(population)
	camera.rumbleAmount += 0.5
