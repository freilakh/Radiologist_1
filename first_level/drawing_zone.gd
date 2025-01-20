extends Control
var answer:Vector2 = Vector2(490,407)
var c_pos:Array = []
func _input(event:InputEvent):
 if (not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) or event.position.x < 1160 or event.position.x > 1850 or event.position.y < 123 or event.position.y > 899:
  return
 c_pos.append(event.position-Vector2(1160,123))
 print(c_pos)
 queue_redraw()

func _draw():
 for line in  c_pos:
  #draw_circle(line,20,Color.DARK_BLUE)
  draw_polyline(c_pos,Color.DARK_BLUE,10)
func _on_area_2d_mouse_entered() -> void:print("on_area") 
