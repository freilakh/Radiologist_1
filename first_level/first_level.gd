extends Control
@onready var message = $message_label as Label
func _ready() -> void:
 message_start()

func message_start() -> void:
 message.visible = false
func show_message(text:String) -> void:
 message.text=text
 var timer := Timer.new()
 add_child(timer)
 timer.wait_time = 3.0
 timer.one_shot = true
 message.visible = true
 timer.start()
 timer.connect("timeout",_timeout)
func _timeout() -> void:
 message.visible = false
