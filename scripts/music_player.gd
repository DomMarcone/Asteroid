extends AudioStreamPlayer

func _on_finished() -> void:
	# PLAY IT AGAIN
	# I could use a loop, I'm doing this in case I want to add more music
	play()
