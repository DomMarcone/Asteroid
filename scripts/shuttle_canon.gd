class_name ShuttleCanon
extends Node3D

const SHUTTLE := preload("res://scenes/shuttle.tscn")

@onready var shuttles := $Shuttles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func posToTheta(pos: Vector2, resolution: Vector2) -> float :
	return atan2(pos.x - resolution.x / 2, pos.y - resolution.y / 2) + PI

func _input(event):
	var resolution := get_viewport().get_visible_rect().size
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		rotation.z = posToTheta(event.position, resolution)
		if event.button_index == 1 and event.pressed :
			var shuttle := SHUTTLE.instantiate()
			shuttle.global_basis = self.global_basis
			shuttles.add_child(shuttle)
	elif event is InputEventMouseMotion:
		rotation.z = posToTheta(event.position, resolution)
