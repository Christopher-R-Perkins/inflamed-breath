extends Node

const levels = [
	"res://scenese/levels/test_level.tscn", 
	"res://scenes/levels/level_1.tscn", 
	"res://scenes/levels/level_2.tscn", 
	"res://scenes/levels/level_3.tscn",
	"res://scenes/levels/level_4.tscn",
	"res://scenes/levels/level_5.tscn",
	"res://scenes/levels/level_6.tscn",
	"res://scenes/levels/level_7.tscn",
	"res://scenes/levels/level_8.tscn",
	"res://scenes/levels/level_9.tscn",
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
