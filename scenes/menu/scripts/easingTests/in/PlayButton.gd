extends "res://scenes/menu/scripts/MenuButton.gd"

func ease_process():
   var ease_output = Ease.easeInElastic(Time.time_passed, ease_offset, ease_length, ease_wobble)
   set_scale_pixel(ease_start + (ease_output * (ease_target - ease_start)))
