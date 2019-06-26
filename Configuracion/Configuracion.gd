extends Control

onready var user = load("res://Configuracion/configuracion de usuario/Config Usuario.tscn").instance()
onready var confiUser = load("res://Configuracion/configuracion de usuario/Config Usuario.tscn")
onready var MenuPrincipal = load("res://Menu principal/MenuPincipal.tscn").instance()




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
	pass

#__________________________________Volver al menu principal
func _on_ButtonMenuprincipal_pressed():
	get_node("/root/").add_child(MenuPrincipal)
	$".".queue_free()
	pass 
#__________________________________Nombre de la rueda
var nombreRueda = null
func _on_NombreRueda_text_changed(new_text):
	nombreRueda = new_text
	pass
func _on_guardar_pressed():
	Global.NombreRueda = nombreRueda
#	print (Global.NombreRueda)
	pass 
#__________________________________Numero de horas del cuadrante
var numHoras = 0
func _on_N_horasDia_text_changed(new_text):
	#_________Expresion regular para reconocer solo numeros
	var regex = RegEx.new()
	regex.compile("^[0-9]+$")
	var result = regex.search(new_text)
#	print(result)
	if result == null:
		$"VBoxContainer/Error ".show()
#		print ("NO has escrito un numero")
	else:
		numHoras = new_text
		$"VBoxContainer/Error ".hide()
		limiteHoras()
#		print (new_text)
	pass 
func limiteHoras():
	if int(numHoras) > 24:
		$VBoxContainer/LimiteHoras.show()
		$VBoxContainer/HorasDia/HBoxContainer/ButtonHorasDia.hide()
	else:
		$VBoxContainer/LimiteHoras.hide()
		$VBoxContainer/HorasDia/HBoxContainer/ButtonHorasDia.show()
		pass
	pass
func _on_ButtonHorasDia_pressed():
	Global.numHoras = numHoras
#	print (Global.numHoras)
	pass 
#__________________________________Nombre nuevo usuario
var userName = null
func _on_NuevoUsuario_pressed():
	$VBoxContainer/NuevoUsuario/HBoxContainer2/nombreUser.show()
	$VBoxContainer/NuevoUsuario/HBoxContainer2/GuardarNuevoUser.show()
	pass
func _on_nombreUser_text_changed(new_text):
	userName = new_text
	pass
func _on_GuardarNuevoUser_pressed():
	Global.numUser += 1
	Global.nombreUser = userName
	Global.CrearUser()
	#_________coloca un VBox a cada usuario creado para organizar el espacio	
	var espacio = VBoxContainer.new()
	espacio.set_name("ContenedorUser-" + str(Global.numUser))
	var contenedorUsers = "VBoxContainer/Usuarios/VBoxContainer/HBoxContainer/"
	get_node(contenedorUsers).add_child(espacio)
	#_________Instancio un boton con el nombre del nuevo usuario	
	var usuario = Button.new()
	usuario.set_name(userName)
	usuario.set_text(userName)
	var nombreEspacio = espacio.get_name()
	get_node(str(contenedorUsers) + str(nombreEspacio)).add_child(usuario)
	#_________Instancia la configuracion de usuario en cada usuario
	var nuevoBoton = (str(contenedorUsers) + str(nombreEspacio) + "/" + str(usuario.name))
	var nuevaConfigUser = confiUser.instance()
	get_node(str(contenedorUsers) + str(nombreEspacio)).add_child(nuevaConfigUser)
#	get_node(str(contenedorUsers) + str(nombreEspacio) + "/Config Usuario").hide()
	#_________Almacena el usuario en el Global
	Global.CrearUser()
	var conectarUserFuncion = "conectarBoton" + str(userName)
		
	
	#_________Conecta el boton instanciado con la funcion usuarioPressed
	usuario.connect("pressed", self, conectarUserFuncion)
	
	pass 


#__________________________________Conecta el boton del usuario con la configuracion del mismo
#signal conectBotonConfigUser 
func conectarBotona():
#	get_node(str(contenedorUsers) + str(nombreEspacio) + "/Config Usuario").show()
#	print(.name)
#	print(get_parent().get_node("Config Usuario"))
#	print()
#	print (userName)
#	emit_signal("conectBotonConfigUser")
#	print(get_node("VBoxContainer/Usuarios/VBoxContainer/HBoxContainer").get_children())
#	var ruta = "/root/Configuracion/VBoxContainer/Usuarios/VBoxContainer/HBoxContainer" 
#	get_node(ruta).add_child(confiUser)
	print ("pulsado por: " +str(userName))

















