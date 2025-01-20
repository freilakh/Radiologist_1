extends Control
@onready var option_button = $HBoxContainer/OptionButton as OptionButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"1980 x 1080": Vector2i(1980,1080),
	"1270x 720" : Vector2i(1270, 720),
}
func _ready():
	option_button.item_selected.connect(on_resolution_selected)
	add_resolution_items()
func add_resolution_items() -> void:
	for resolution_size_text in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_size_text)
	
func on_resolution_selected(index : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
