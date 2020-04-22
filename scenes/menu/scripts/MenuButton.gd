extends "res://addons/CustomButtonShapeNode/CustomButtonShapeScript.gd"

# Exports
export var init_position = Vector2(OS.window_size.x / 2, 200)

# Easing variables
var ease_offset: float = Time.time_passed
var ease_start  := 0.0
var ease_target := 0.0
var ease_length := Settings.ease_length
var ease_wobble := Settings.ease_wobble

# Scale variables
var scale_init  = Settings.size_small
var scale_hover = Settings.size_large

func _ready():
   position = init_position
   set_scale_pixel(scale_init)
   ease_target_set(scale_init)
   
func _process(_delta):
   ease_process()
   
func _input(event):
   if event.is_action_pressed("ui_accept"):
      ease_target_set(scale_hover)
   elif event.is_action_released("ui_accept"):
      ease_target_set(scale_init)

func _on_mouse_entered():
   ease_target_set(scale_hover)
   
func _on_mouse_exited():
   ease_target_set(scale_init)
   
func ease_target_set(target):
   ease_offset = Time.time_passed
   ease_start = get_scale_pixel()
   ease_target = target
   
func ease_process():
   var ease_output = Ease.easeOutElastic(Time.time_passed, ease_offset, ease_length, ease_wobble)
   set_scale_pixel(ease_start + (ease_output * (ease_target - ease_start)))
