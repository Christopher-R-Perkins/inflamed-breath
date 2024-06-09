extends Node

const levels = [
	"res://scenese/test_level.tscn", 
	"res://scenes/level_1.tscn", 
	"res://scenes/level_2.tscn", 
	"res://scenes/level_3.tscn",
	"res://scenes/level_4.tscn",
	"res://scenes/level_5.tscn",
]

var current_level = 1
var loop = 0

func complete():
	current_level += 1
	if current_level == levels.size():
		loop += 1
		current_level = 1
	
	get_tree().change_scene_to_file(levels[current_level])

func load_level(number: int) -> void:
	current_level = number
	loop = 0
	get_tree().change_scene_to_file(levels[number])
	if !LevelMusic.playing:
		LevelMusic.play()
