tool
extends EditorPlugin


func _enter_tree():
   add_custom_type("CustomButtonShape", "Area2D", preload("./CustomButtonShapeScript.gd"), preload("./CustomButtonShapeIcon.svg"))


func _exit_tree():
   remove_custom_type("CustomButtonShape")
   pass
