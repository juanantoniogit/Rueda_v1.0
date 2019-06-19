extends Control

onready var user = load("res://Configuracion/configuracion de usuario/Config Usuario.tscn").instance()
onready var confiUser = load("res://Configuracion/configuracion de usuario/Config Usuario.tscn").instance()


func _ready():
	if Global.NombreRueda == null:
		$"VBoxContainer/NombreRueda/Necesitas poner nombre a la rueda".show()
	else:
		$"VBoxContainer/NombreRueda/Necesitas poner nombre a la rueda".hide()


func _process(delta):
	if Global.NombreRueda == null:
		$VBoxContainer/HorasDia.hide()
		$VBoxContainer/NuevoUsuario.hide()
	else:
		$"VBoxContainer/NombreRueda/Necesitas poner nombre a la rueda".hide()
		$VBoxContainer/HorasDia.show()
	if Global.numHoras == null:
		$VBoxContainer/NuevoUsuario.hide()
	else:
		$VBoxContainer/NuevoUsuario.show()
#	pass

#__________________________________Nombre de la rueda
func _on_Necesitas_poner_nombre_a_la_rueda_pressed():
	$"VBoxContainer/NombreRueda/Necesitas poner nombre a la rueda".hide()
	pass # Replace with function body.

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
	var ruta = "/root/Configuracion/VBoxContainer/Usuarios/HBoxContainer/" + str(userName)
	get_node(ruta).add_child(confiUser)
	print (get_node(ruta).name)
	
	pass 









