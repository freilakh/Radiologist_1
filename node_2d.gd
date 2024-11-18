extends Node2D
func addline(start, end):
	var line = Line2D.new()
	line.add_point(start)
	line.add_point(end)
	line.default_color = Color("000000")
	line.begin_cap_mode = Line2D.LINE_CAP_ROUND
	line.end_cap_mode = Line2D.LINE_CAP_ROUND
	add_child(line)
func _unhandled_input(event):
	if event is InputEventScreenDrag:
		print(event.position)
		var start = event.position - event.relative
		var end = event.position
		addline(start, end)
