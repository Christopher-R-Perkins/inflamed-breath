extends StaticBody2D

@export var required = false

@onready var light = $PointLight2D
var breather = null
var animated_sprite = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light.visible = false
	for child in get_children():
		if child is AnimatedSprite2D:
			animated_sprite = child
			child.play('idle')
		
		if child is Breather:
			breather = child

func alight() -> void:
	light.visible = true
	collision_layer = 0
	
	if animated_sprite:
		animated_sprite.play('aflame')

	if breather:
		breather.enabled = true
	
	if required:
		EventBus.emit_signal('brazier_lit')
