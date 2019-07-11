extends MarginContainer
onready var boton = $Button
signal nombreUsuarioBoton 

func _on_Button_pressed():
	get_parent().get_node("Config Usuario").show()
#	print("Nombre boton: " + str(boton.name))
#	print("Nº de usuario: " + str(Global.Usuarios[boton.name]))
	emit_signal("nombreUsuarioBoton")
	pass



