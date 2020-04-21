extends Area2D

func _ready():
   setup_position()
   
func _process(delta):
   position

func _input_event(viewport, event, shape_idx):
   if event.is_action_released("ui_accept"):
      print(event)

func setup_position():
   position = Vector2(OS.window_size.x / 2, 100)
