class_name LevelOverlay
extends Control

func _ready() -> void:
	visible = false

func enable():
	%Evy.free()
	%LevelTimer.disable()
	visible = true
