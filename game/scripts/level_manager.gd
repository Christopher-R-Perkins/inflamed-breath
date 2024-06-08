extends Node

const levels = [
	"res://scenese/test_level.tscn", 
	"res://scenes/level_1.tscn", 
	"res://scenes/level_2.tscn", 
	"res://scenes/level_3.tscn",
]

var current_level = 1

func complete():
	current_level += 1
	get_tree().change_scene_to_file(levels[current_level])

func load_level(number: int) -> void:
	current_level = number
	get_tree().change_scene_to_file(levels[number])
