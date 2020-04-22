tool
extends "res://addons/CustomButtonShapeNode/CustomButtonShapeScript.gd"

func _ready():
   handle_err(self.connect("pressed", self, "_on_pressed"))
   position = Vector2(OS.window_size.x / 2, 100)
   set_scale_pixel(100)

func _on_pressed():
   print("pressed!")

func handle_err(err):
   if err != 0:
      push_error("something bad happened")

