extends Control

var c_pos:Array = []
func _input(event:InputEvent):
 if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
  return
 c_pos.append(event.position)
 queue_redraw()

func _draw():
 for line in  c_pos:
  draw_circle(line,10,Color.DARK_BLUE)

func _on_area_2d_mouse_entered() -> void:print("on_area") 
  
