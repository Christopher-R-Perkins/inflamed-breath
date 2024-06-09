extends Button

func _ready() -> void:
	grab_focus()

func _pressed() -> void:
	LevelManager.load_level(1)
