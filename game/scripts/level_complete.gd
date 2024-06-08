extends LevelOverlay

func _process(_delta: float) -> void:
	if !visible:
		return
	
	var can_continue = Input.is_action_just_pressed('jump')
	
	if can_continue:
		LevelManager.complete()
