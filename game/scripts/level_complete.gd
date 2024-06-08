extends LevelOverlay

func _process(delta: float) -> void:
	if !visible:
		return
	
	var can_continue = Input.is_action_just_pressed('jump')
	
	if can_continue:
		EventBus.level_complete.emit()
