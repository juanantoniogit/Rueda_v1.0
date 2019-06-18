extends Control
var Configuracion = preload("res://Configuracion/Configuracion.tscn").instance()


#func _ready():
#
#	pass

#func _process(delta):
#
#	pass


func _on_NuevaRueda_pressed():
	get_node("/root/").add_child(Configuracion)
	$".".queue_free()
	pass # replace with function body
