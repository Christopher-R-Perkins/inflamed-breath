extends Control

@export var total_oxygen = 100

@onready var oxygen_bar = $ColorRect

const BAR_MAX_Y = 96
const HUE_MAX = 0.333

enum DIM_STATE { Ablaze, Dim, Dark, Out }

var state = DIM_STATE.Ablaze
var enabled = true
var current_oxygen = 100

func _ready() -> void:
	EventBus.connect('oxygen_used', _oxygen_used)
	current_oxygen = total_oxygen - int(.1 * LevelManager.loop * total_oxygen)
	_setBar(1 - .1 * LevelManager.loop)
	
func _oxygen_used(amount):
	if !enabled:
		return
		
	current_oxygen = max(0, current_oxygen - amount)
	
	if current_oxygen == 0:
		%GameOver.enable()
	
	var percent = (1.0 * current_oxygen) / total_oxygen
	_setBar(percent)
	
	if state == DIM_STATE.Ablaze && percent <= .6:
		EventBus.dim.emit(.6)
		state = DIM_STATE.Dim
	elif state == DIM_STATE.Dim && percent <= .3:
		EventBus.dim.emit(.3)
		state = DIM_STATE.Dark
	elif state == DIM_STATE.Dark && percent <= .1:
		EventBus.dim.emit(.1)
		state = DIM_STATE.Out

func disable():
	enabled = false
	
func _setBar(percent: float) -> void:
	oxygen_bar.size.y = int(percent * BAR_MAX_Y)
	oxygen_bar.color.h = percent * HUE_MAX
