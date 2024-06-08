extends Node

const levels = ["res://scenes/test_level.tscn", "res://scenes/level_2.tscn"]

var current_level = 0

func _ready() -> void:
	EventBus.connect('level_complete', _on_level_complete)

func _on_level_complete():
	current_level += 1
	get_tree().change_scene_to_file(levels[current_level])
