class_name FlamableBridge
extends Node2D

const TIME_BEFORE_SPREAD = .2

@export var breathable = false
@export var neighbors: Array[FlamableBridge]

@onready var breather = $Flamable/Breather
@onready var flamable = $Flamable

func _ready() -> void:
	if (!breathable):
		breather.amount = 0

func _on_flamable_burned() -> void:
	await get_tree().create_timer(TIME_BEFORE_SPREAD).timeout
	for object in neighbors:
		object.alight()

func alight() -> void:
	flamable.alight()
