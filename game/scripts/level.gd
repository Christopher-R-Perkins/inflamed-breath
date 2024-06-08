class_name Level
extends Node2D

@export var number: int

func _process(delta: float) -> void:
	var reset = Input.is_action_just_pressed('reset')
	if reset:
		get_tree().reload_current_scene()
