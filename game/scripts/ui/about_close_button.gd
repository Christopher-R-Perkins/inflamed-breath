extends Button

func _pressed() -> void:
	%About.visible = false
	%Buttons.visible = true
	%AboutButton.grab_focus()
