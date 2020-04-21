extends Area2D

onready var sprite = get_node("./Sprite")

func _ready():
   setup_position()
   set_scale_pixel(100)

func _input_event(_viewport, event, _shape_idx):
   if event.is_action_released("ui_accept"):
      print(event)

func setup_position():
   position = Vector2(OS.window_size.x / 2, 100)

func set_scale_pixel(pixel_scale: float, by_height=true):
   var tex = sprite.texture
   var size_reference = tex.get_height() if by_height else tex.get_width()
   var new_scale = pixel_scale / size_reference
   scale = Vector2(new_scale, new_scale)
   if new_scale > 1:
      push_warning("Sprite scale %2.2f > 1, may experience artifacts" % new_scale)
   elif new_scale <= 0:
      push_warning("Sprite scale %2.2f <= 0" % new_scale)
