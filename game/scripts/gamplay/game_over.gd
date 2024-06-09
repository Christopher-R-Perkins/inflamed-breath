extends LevelOverlay

@onready var sfx = $LoseJingle

func enable() -> void:
	sfx.play()
	super()
