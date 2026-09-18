class_name KillScreen
extends Control

var gameMode : GameModeA

var time : float

@onready var score := $score

func _ready() -> void:
	score.text = Util.getTime(time)
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event: InputEvent) -> void:
	if event is InputEventKey and !event.pressed :
		gameMode.queue_free()
		get_tree().paused = false
		get_tree().change_scene_to_file("res://scenes/game_mode_a.tscn")
