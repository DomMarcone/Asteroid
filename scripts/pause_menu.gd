class_name PauseMenu
extends Control

@onready var back := $rect

func _ready() -> void :
	process_mode = Node.PROCESS_MODE_ALWAYS

func showPaused(showPauseScreen) :
	if showPauseScreen :
		back.show()
	else :
		back.hide()

func _unhandled_input(event: InputEvent) -> void :
	if event is InputEventKey :
		if event.keycode == KEY_ESCAPE and event.pressed :
			var isPaused = !get_tree().paused
			get_tree().paused = isPaused
			showPaused(isPaused)
