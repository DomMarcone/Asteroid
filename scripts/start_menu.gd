extends Node3D

const GAME_MODE_A := preload("res://scenes/game_mode_a.tscn")

func startGame() -> void:
	var gameMode := GAME_MODE_A.instantiate()
	get_parent().add_child(gameMode)
	queue_free()

func _input(event: InputEvent) -> void:
	if event is InputEventKey :
		if event.pressed :
			startGame()
	if event is InputEventMouseButton :
		if event.pressed :
			startGame()
			
