extends Control

onready var user = load("res://Configuracion/configuracion de usuario/Config Usuario.tscn").instance()


#func _ready():
#
#	pass

#func _process(delta):
#
#	pass

#__________________________________Nombre de la rueda
var nombreRueda = null
func _on_NombreRueda_text_changed(new_text):
	nombreRueda = new_text
	pass
func _on_guardar_pressed():
	Global.NombreRueda = nombreRueda
	print (Global.NombreRueda)
	pass 
#__________________________________Numero de horas del cuadrante
var numHoras = null
func _on_N_horasDia_text_changed(new_text):
	numHoras = new_text
	pass 
func _on_Button_pressed():
	Global.numHoras = numHoras
	print (Global.numHoras)
	pass 
#__________________________________Nombre nuevo usuario
var userName = null
func _on_nombreUser_text_changed(new_text):
	userName = new_text
	pass
func _on_NuevoUsuario_pressed():
	$VBoxContainer/NuevoUsuario/HBoxContainer2/nombreUser.show()
	$VBoxContainer/NuevoUsuario/HBoxContainer2/ButtonNuevoUser.show()
	pass
func _on_ButtonNuevoUser_pressed():
	Global.numUser += 1
	Global.nombreUser = userName
	print (Global.numUser)
	pass 






