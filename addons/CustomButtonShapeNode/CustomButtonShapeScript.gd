tool
extends Area2D
# Button which has a custom shape and sprite

signal pressed

# Child sprite node
var _sprite
# Number of child sprite nodes
var _sprite_count
# Whether a click is sustained in hovering
var _click_hover := false
# Whether the mouse is hovering over the object
var hovering := false

func _ready():
   get_sprite()
   get_tree().connect("tree_changed", self, "_on_tree_changed")
   self.connect("mouse_entered", self, "_on_mouse_entered")
   self.connect("mouse_exited", self, "_on_mouse_exited")
   for child in get_children():
      child.position = position

func _input_event(_viewport, event, _shape_idx):
   if event.is_action_pressed("ui_accept"):
      _click_hover = true
   elif event.is_action_released("ui_accept"):
      if _click_hover:
         emit_signal("pressed")
      _click_hover = false
      

func _on_tree_changed():
   get_sprite()
   _get_configuration_warning()

func _on_mouse_entered():
   hovering = true
   
func _on_mouse_exited():
   hovering = false
   _click_hover = false

func _get_configuration_warning():
   var return_msg = ""
   if _sprite_count == 0:
      return_msg = "No sprite added as child, things will break okay?"
   elif _sprite_count > 1:
      return_msg = "More than 1 sprite as child, bad things will happen."
   elif _sprite.texture == null:
      return_msg = "No texture assigned to sprite, bad things will happen."
   return return_msg

# Sets the absolute size of the button based on the sprite.
func set_scale_pixel(pixel_scale: float, by_height=true):
   var tex = _sprite.texture
   var size_reference = tex.get_height() if by_height else tex.get_width()
   var new_scale = pixel_scale / size_reference
   scale = Vector2(new_scale, new_scale)
   if new_scale > 1:
      push_warning("Sprite scale %2.2f > 1, may experience artifacts" % new_scale)
   elif new_scale <= 0:
      push_warning("Sprite scale %2.2f <= 0" % new_scale)

# Gets the sprite
func get_sprite():
   _sprite_count = 0
   for child in get_children():
      if child.get_class() == "Sprite":
         _sprite_count += 1
         _sprite = child
