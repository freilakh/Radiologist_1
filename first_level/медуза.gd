extends Sprite2D
@onready var mes1 = $"../Message 1"
@onready var mes2 = $"../Message 2"
@onready var mes3 = $"../Message 3"
@onready var sound1 = $"../Sound 1"
@onready var sound2 = $"../Sound 2"
@onready var sound3 = $"../Sound 3"
var counter = 0	

func _ready() -> void:
	mes1.visible = false
	mes2.visible = false
	mes3.visible = false
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and event.position.x > 450 and event.position.x < 800 and event.position.y > 450 and event.position.y < 950:
		if counter == 0:
			mes1.visible = true
			sound1.play()
			counter = 1
		elif counter == 1:
			mes1.visible = false
			mes2.visible = true
			sound1.stop()
			sound2.play()
			counter = 2
		else:
			mes2.visible = false
			mes3.visible = true
			sound2.stop()
			sound3.play()
