extends Node

func _ready():
   var children = get_children()
   var step = float(OS.window_size.x) / children.size()
   var next_spawn = step - (step / 2.0)
   for child in children:
      child.position = Vector2(next_spawn, OS.window_size.y / 2)
      next_spawn += step
