extends Control

@export var total_oxygen = 100

@onready var oxygen_bar = $ColorRect
const BAR_MAX_Y = 96
const HUE_MAX = 0.333
var enabled = true

var current_oxygen = 100

func _ready() -> void:
	current_oxygen = total_oxygen
	EventBus.connect('oxygen_used', _oxygen_used)
	
func _oxygen_used(amount):
	if !enabled:
		return
		
	current_oxygen = max(0, current_oxygen - amount)
	
	if current_oxygen == 0:
		%GameOver.enable()
	
	var percent = (1.0 * current_oxygen) / total_oxygen
	oxygen_bar.size.y = int(percent * BAR_MAX_Y)
	oxygen_bar.color.h = percent * HUE_MAX
	

func disable():
	enabled = false
