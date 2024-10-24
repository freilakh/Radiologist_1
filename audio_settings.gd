extends Control
@onready var audio_name = $HBoxContainer/Audio_name as Label
@onready var audio_num = $HBoxContainer/Audio_num as Label
@onready var slider_a = $HBoxContainer/HSlider as Slider

@export_enum("Master", "ЭФФЕКТОВ", "МЕДУЗЫ") var bus_name : String
var bus_index : int = 0

func _ready():
	slider_a.value_changed.connect(on_value_changed)
	get_bus_index()
	set_name_label_text()
	set_slider_value()
	
func set_name_label_text() -> void:
	audio_name.text = " ГРОМКОСТЬ " + str(bus_name) 

func set_audio_num_label_text() -> void:
	audio_num.text = str(slider_a.value * 100)
	
func on_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_audio_num_label_text()
func get_bus_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)

func set_slider_value():
	slider_a.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_audio_num_label_text()
