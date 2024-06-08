class_name Breather
extends Node

@export var enabled = false
@export var amount = 1
var timer = 1

func _process(delta: float) -> void:
	if !enabled:
		return
	
	timer -= delta
	
	if timer > 0:
		return
	
	timer = 1
	EventBus.oxygen_used.emit(amount)
