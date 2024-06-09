extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func enable() -> void:
	%Buttons.visible = false
	visible = true
	$CloseButton.grab_focus()
