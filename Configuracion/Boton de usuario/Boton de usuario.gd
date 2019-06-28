extends MarginContainer
onready var boton = $Button


func _on_Button_pressed():
	get_parent().get_node("Config Usuario").show()
	print(boton.name)
	print(Global.Usuarios[boton.name])
	
	pass



