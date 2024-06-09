extends Control

var master_bus_index: int
var sfx_bus_index: int
var music_bus_index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	master_bus_index = AudioServer.get_bus_index("Master")
	sfx_bus_index = AudioServer.get_bus_index("SFX")
	music_bus_index = AudioServer.get_bus_index('Music')

func enable() -> void:
	%Buttons.visible = false
	visible = true
	$MasterVolume.grab_focus()


func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus_index, linear_to_db(value))


func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus_index, linear_to_db(value))


func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus_index, linear_to_db(value))
