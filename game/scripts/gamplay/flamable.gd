extends StaticBody2D

@export var required = false
@export var light_scale = 0.2

@onready var light = $PointLight2D

signal burned()

const MAX_ENERGY = 2.0

var breather = null
var animated_sprite = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light.texture_scale = light_scale
	light.visible = false
	EventBus.connect('dim', _dim)
	for child in get_children():
		if child is AnimatedSprite2D:
			animated_sprite = child
			child.play('idle')
		
		if child is Breather:
			breather = child

func _dim(percent: float) -> void:
	light.energy = MAX_ENERGY * percent

func alight() -> void:
	light.visible = true
	collision_layer = 0
		
	if animated_sprite:
		animated_sprite.play('aflame')

	if breather:
		breather.enabled = true
	
	if required:
		EventBus.emit_signal('brazier_lit')

	burned.emit()
