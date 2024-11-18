extends Button
@onready var draw_zone = %drawing_zone
func _pressed():
 draw_zone.c_pos.clear()
 draw_zone.queue_redraw()
