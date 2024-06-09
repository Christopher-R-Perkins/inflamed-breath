extends Node2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var sfx = $DoorSfx

var totalNeeded = 0
var locked = true

func _ready() -> void:
	var flamable = get_tree().get_nodes_in_group('Flamable Objects')
	totalNeeded = flamable.filter(func(object): return object.required).size()
	
	animated_sprite.play('locked')
	EventBus.connect('brazier_lit', _brazier_lit)
	
func _brazier_lit():
	totalNeeded -= 1

	if totalNeeded <= 0:
		locked = false
		sfx.play()
		animated_sprite.play('unlocked')

func _on_area_2d_body_entered(_body) -> void:
	if !locked:
		%LevelComplete.enable()
