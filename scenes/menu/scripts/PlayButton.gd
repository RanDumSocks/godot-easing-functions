tool
extends "res://addons/CustomButtonShapeNode/CustomButtonShapeScript.gd"

var ease_offset: float = Time.time_passed
var ease_start := 0.0
var ease_target := 0.0

func _ready():
   var init_scale = 100
   handle_err(self.connect("pressed", self, "_on_pressed"))
   position = Vector2(OS.window_size.x / 2, 200)
   set_scale_pixel(init_scale)
   ease_target_set(init_scale)
   
func _process(_delta):
   ease_process()

func _on_pressed():
   pass

func _on_mouse_entered():
   ease_target_set(150)
   
func _on_mouse_exited():
   ease_target_set(100)
   
func ease_target_set(target):
   ease_offset = Time.time_passed
   ease_start = get_scale_pixel()
   ease_target = target
   
func ease_process():
   set_scale_pixel(ease_start + (Ease.easeOutElastic(Time.time_passed, ease_offset, 1, 5) * (ease_target - ease_start)))
   
func handle_err(err):
   if err != 0:
      push_error("something bad happened")

