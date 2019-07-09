extends Control

onready var confiUser = load("res://Configuracion/configuracion de usuario/Config Usuario.tscn")
onready var MenuPrincipal = load("res://Menu principal/MenuPincipal.tscn").instance()
onready var BotonUsuario = load("res://Configuracion/Boton de usuario/Boton de usuario.tscn")
onready var Cuadrante = load("res://Cuadrante/Cuadrante.tscn").instance()


func _process(delta):
	if Global.NombreRueda == null:
		$Config/VBoxContainer/HorasDia.hide()
		$Config/VBoxContainer/NuevoUsuario.hide()
	else:
		$Config/VBoxContainer/HorasDia.show()
	if Global.numHoras == null:
		$Config/VBoxContainer/NuevoUsuario.hide()
	else:
		$Config/VBoxContainer/NuevoUsuario.show()
	verGuardar()
	NumUser()
	ExistName()
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

func verGuardar():
	#_________si no hay nombre no se ve el boton de guardar.
	#_________Esta corriendo en func process
	if nombreRueda == null:
		$"Config/VBoxContainer/NombreRueda/HBoxContainer/guardar".hide()
	else:
		$"Config/VBoxContainer/NombreRueda/HBoxContainer/guardar".show()
	pass
func _on_guardar_pressed():
	Global.NombreRueda = nombreRueda
	pass 
#__________________________________Numero de horas del cuadrante
var numHoras = 0
func _on_N_horasDia_text_changed(new_text):
	#_________Expresion regular para reconocer solo numeros
	var regex = RegEx.new()
	regex.compile("^[0-9]+$")
	var result = regex.search(new_text)
	if result == null:
		$"Config/VBoxContainer/Error".show()
		$"Config/VBoxContainer/HorasDia/HBoxContainer/ButtonHorasDia".hide()
#		print ("NO has escrito un numero")
	else:
		numHoras = new_text
		$"Config/VBoxContainer/Error".hide()
		$"Config/VBoxContainer/HorasDia/HBoxContainer/ButtonHorasDia".show()
		limiteHoras()
	pass 
func limiteHoras():
	if int(numHoras) > 24:
		$Config/VBoxContainer/LimiteHoras.show()
		$Config/VBoxContainer/HorasDia/HBoxContainer/ButtonHorasDia.hide()
	else:
		$Config/VBoxContainer/LimiteHoras.hide()
		$Config/VBoxContainer/HorasDia/HBoxContainer/ButtonHorasDia.show()
		pass
	pass
func _on_ButtonHorasDia_pressed():
	Global.numHoras = numHoras
	get_node("Config").add_child(Cuadrante)
#	print (Global.numHoras)
	pass 
#__________________________________Numero de usuarios
func NumUser():
	var numUser = "Numero de usuarios: " + str(len(Global.Usuarios))
	$Config/VBoxContainer/NumUsuarios/NumeroUsuarios.set_text(numUser)
	pass 
#__________________________________Nombre nuevo usuario
var userName = null
#func _on_NuevoUsuario_pressed():
#	$VBoxContainer/NuevoUsuario/HBoxContainer2/nombreUser.show()
#	$VBoxContainer/NuevoUsuario/HBoxContainer2/GuardarNuevoUser.show()
#	pass
func _on_nombreUser_text_changed(new_text):
	userName = new_text	
	#__________Comprueba que el nuevo nombre no exista.
func ExistName():
	#__________se activa en func proces
	for i in range(len(Global.Usuarios)):
		if str(Global.UserNombre[i+1]) == userName:
#			print ("el nombre ya existe")
			$"Config/VBoxContainer/Error/Mensaje ERROR".set_text("El nombre ya existe")
			$"Config/VBoxContainer/NuevoUsuario/HBoxContainer2/GuardarNuevoUser".hide()
			$"Config/VBoxContainer/Error".show()
			return
		else:
#			print("nuevo usuario guardado")
			$"Config/VBoxContainer/NuevoUsuario/HBoxContainer2/GuardarNuevoUser".show()
			$"Config/VBoxContainer/Error".hide()
			Global.CrearUser()
#			print(Global.Usuarios)
	pass
func _on_GuardarNuevoUser_pressed():
#	print(Global.Usuarios)
	Global.numUser += 1
	Global.nombreUser = userName
	Global.CrearUser()
#_________coloca un VBox a cada usuario creado para organizar el espacio	
	var espacio = VBoxContainer.new()
	espacio.set_name("ContenedorUser-" + str(Global.numUser))
	var contenedorUsers = "Config/VBoxContainer/Usuarios/VBoxContainer/HBoxContainer/"
	get_node(contenedorUsers).add_child(espacio)
#_________Instancio la escena del boton de usuario con el nombre del nuevo usuario	
	var nombreEspacio = espacio.get_name()
	var nuevoBotonUser = BotonUsuario.instance()
	get_node(str(contenedorUsers) + str(nombreEspacio)).add_child(nuevoBotonUser)
	var botonUser = get_node(str(contenedorUsers) + str(nombreEspacio) + "/Boton de usuario/Button" )
	botonUser.set_text(userName)
	botonUser.set_name(userName)
#_________Instancia la configuracion de usuario en cada usuario
	var nuevaConfigUser = confiUser.instance()
	get_node(str(contenedorUsers) + str(nombreEspacio)).add_child(nuevaConfigUser)
	get_node(str(contenedorUsers) + str(nombreEspacio) + "/" + str(nuevaConfigUser.name)).hide()
	pass 

















