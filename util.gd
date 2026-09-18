class_name Util
extends Node

static func getTime(time) -> String :
	return "%01d:%02d.%03d" % [int(time / 60), int(fmod(time, 60)), int(fmod(time * 1000, 1000))]
