extends Control

var drawing_texture: ImageTexture
var drawing_image: Image
var last_mouse_position: Vector2
var is_drawing: bool = false

func _ready():
	# Инициализация текстуры и изображения
	drawing_image = Image.new()
	drawing_image.create(400, 400, false, Image.FORMAT_RGBA8) # Задайте размер поля
	drawing_image.fill(Color(1, 1, 1, 1)) # Заполнить белым цветом
	drawing_texture = ImageTexture.new()
	drawing_texture.create_from_image(drawing_image)
	$TextureRect.texture = drawing_texture
	
func _input(event):
	if event is InputEventMouseMotion:
		if is_drawing:
			draw_line(last_mouse_position, event.position)
			last_mouse_position = event.position

	elif event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			is_drawing = true
			last_mouse_position = event.position.clamped(Vector2.ZERO, Vector2(400, 400)) # Ограничиваем область рисования
		elif !event.pressed and event.button_index == BUTTON_LEFT:
			is_drawing = false

func draw_line(from_pos: Vector2, to_pos: Vector2):
	# Ограничиваем координаты до области рисования
	from_pos = from_pos.clamped(Vector2.ZERO, Vector2(400, 400))
	to_pos = to_pos.clamped(Vector2.ZERO, Vector2(400, 400))

	if from_pos != to_pos:
		# Рисуем линию на изображении
		var color = Color(0, 0, 0, 1) # Черный цвет для рисования
		drawing_image.lock()
		drawing_image.draw_line(from_pos, to_pos, color, 2) # Толщина линии 2 пикселя
		drawing_image.unlock()

		# Обновляем текстуру
		drawing_texture.create_from_image(drawing_image)
