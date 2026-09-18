class_name Explosion
extends AnimatedSprite3D

@onready var audioPlayer := $AudioStreamPlayer3D

func _ready() -> void :
	#stream = EXPLOSION_SOUNDS.pick_random()
	#self.resourc
	#audioPlayer.stream = EXPLOSION_SOUNDS.pick_random()
	pass

func _on_animation_finished() -> void:
	queue_free()
