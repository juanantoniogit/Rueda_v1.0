extends Control
var Configuracion = preload("res://Configuracion/Configuracion.tscn").instance()


#__________________________________Cambio de escena
func _on_NuevaRueda_pressed():
	get_node("/root/").add_child(Configuracion)
	$".".queue_free()
	pass
