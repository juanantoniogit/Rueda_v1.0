extends Control

onready var user = load("res://Configuracion/configuracion de usuario/Config Usuario.tscn").instance()
onready var confiUser = load("res://Configuracion/configuracion de usuario/Config Usuario.tscn").instance()


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
var numHoras = 0
func _on_N_horasDia_text_changed(new_text):
	if numHoras/100 < 1:
			numHoras = new_text
	else:
		print("No has introducido un valor numerico o es muy grande")
	pass 
func _on_Button_pressed():
	Global.numHoras = numHoras
	print (Global.numHoras)
	pass 
#__________________________________Nombre nuevo usuario
var userName = null
func _on_NuevoUsuario_pressed():
	$VBoxContainer/NuevoUsuario/HBoxContainer2/nombreUser.show()
	$VBoxContainer/NuevoUsuario/HBoxContainer2/ButtonNuevoUser.show()
	pass
func _on_nombreUser_text_changed(new_text):
	userName = new_text
	pass
func _on_ButtonNuevoUser_pressed():
	Global.numUser += 1
	Global.nombreUser = userName
	print (Global.numUser)
#_________Instancio un boton con el nombre del nuevo usuario	
	var usuario = Button.new()
	usuario.set_name(userName)
	usuario.set_text(userName)
	$VBoxContainer/Usuarios/HBoxContainer.add_child(usuario)
#_________
	print(($"/root/Configuracion/VBoxContainer/Usuarios/HBoxContainer/" + str(userName)).name)
	
	pass 






