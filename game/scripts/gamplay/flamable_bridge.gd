class_name FlamableBridge
extends Node2D

const TIME_BEFORE_SPREAD = .1

@export var breathable = false
@export var lit = false
@export var neighbors: Array[FlamableBridge]

@onready var breather = $Flamable/Breather
@onready var flamable = $Flamable

func _ready() -> void:
	flamable.lit = lit

func _on_flamable_burned() -> void:
	await get_tree().create_timer(TIME_BEFORE_SPREAD).timeout
	
	breather.enabled = breathable
	
	for object in neighbors:
		object.alight()

func alight() -> void:
	flamable.alight()
