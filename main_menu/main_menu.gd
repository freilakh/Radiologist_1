class_name main_menu
extends Control
#задаю каждую кнопку
@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/start_button as Button
@onready var option_button = $MarginContainer/HBoxContainer/VBoxContainer/option_button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/exit_button as Button
@onready var option_menu = $option_menu as OptionMenu
@onready var margin_container = $MarginContainer as MarginContainer
@export var Start_level = preload('res://first_level/first_level.tscn') as PackedScene
func _ready():
	handle_connections()
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(Start_level)

func on_options_pressed() -> void:
	margin_container.visible = false
	option_menu.set_process(true)
	option_menu.visible = true

func on_exit_pressed() -> void:
	get_tree().quit()
func on_exit_options_menu() -> void:
	margin_container.visible = true
	option_menu.visible = false
func handle_connections() -> void:
	start_button.button_down.connect(on_start_pressed)
	option_button.button_down.connect(on_options_pressed)	
	exit_button.button_down.connect(on_exit_pressed)
	option_menu.exit_options_menu.connect(on_exit_options_menu)
	
	
