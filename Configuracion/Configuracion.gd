extends Control

onready var user = load("res://Configuracion/configuracion de usuario/Config Usuario.tscn").instance()
onready var confiUser = load("res://Configuracion/configuracion de usuario/Config Usuario.tscn").instance()




func _process(delta):
	if Global.NombreRueda == null:
		$VBoxContainer/HorasDia.hide()
		$VBoxContainer/NuevoUsuario.hide()
	else:
		$VBoxContainer/HorasDia.show()
	if Global.numHoras == null:
		$VBoxContainer/NuevoUsuario.hide()
	else:
		$VBoxContainer/NuevoUsuario.show()
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
	#_________Expresion regular para reconocer solo numeros
	var regex = RegEx.new()
	regex.compile("^[0-9]+$")
	var result = regex.search(new_text)
	print(result)
	if result == null:
		$VBoxContainer/HorasDia/HBoxContainer/Button.hide()
		$"VBoxContainer/HorasDia/HBoxContainer/Mensaje ERROR".show()
		
		print ("NO has escrito un numero")
	else:
		print (new_text)
		$VBoxContainer/HorasDia/HBoxContainer/Button.show()
		$"VBoxContainer/HorasDia/HBoxContainer/Mensaje ERROR".hide()
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
	$VBoxContainer/Usuarios/VBoxContainer/HBoxContainer.add_child(usuario)
#_________Conecta el boton instanciado con la funcion usuarioPressed
	usuario.connect("pressed", self, "usuarioPressed")

#_________
	
	
	pass 
	
func usuarioPressed():
	#_________Coloca la configuracion de usuario
	var ruta = "/root/Configuracion/VBoxContainer/Usuarios/VBoxContainer/" 
	get_node(ruta).add_child(confiUser)
	print ("pulsado")









