class_name OptionMenu
extends Control

@onready var exit_option_button = $MarginContainer/VBoxContainer/Exit_Button as Button
signal exit_options_menu

func _ready():
	exit_option_button.button_down.connect(on_option_exit_pressed)
	set_process(false)
	
func on_option_exit_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)
