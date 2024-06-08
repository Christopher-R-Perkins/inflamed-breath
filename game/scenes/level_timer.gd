extends Control

@export var total_oxygen = 100

@onready var oxygen_bar = $ColorRect
const BAR_MAX_Y = 96
const HUE_MAX = 0.333

var current_oxygen = 100

func _ready() -> void:
	current_oxygen = total_oxygen
	EventBus.connect('oxygen_used', _oxygen_used)
	
func _oxygen_used(amount):
	current_oxygen = max(0, current_oxygen - amount)
	
	# need to game over if 0
	
	var percent = (1.0 * current_oxygen) / total_oxygen
	oxygen_bar.size.y = int(percent * BAR_MAX_Y)
	oxygen_bar.color.h = percent * HUE_MAX
