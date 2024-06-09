extends Button

@export var focus_button: Button
@export var parent_panel: Control

func _pressed() -> void:
	parent_panel.visible = false
	%Buttons.visible = true
	focus_button.grab_focus()
